class DestinationDb < ActiveRecord::Base
  establish_connection(:development_dest) #abstract db name based on env
 
  def self.get_tables
    return DestinationDb.connection.tables
  end

  def self.get_data(table_name)
    return DestinationDb.connection.select_all("select * from #{table_name};")
  end

  def self.get_definition(table_name)
    arr = []
    DestinationDb.connection.execute("describe #{table_name};").each{|r| arr << r}

    return arr
  end

  def self.get_sample_row(table_name)
    arr = Hash.new("")

    col_defs = DestinationDb.get_definition(table_name)

    col_defs.each do |col_def|
      arr[col_def[0]] = ""
    end

    return arr
  end


  def self.get_column_names(table_name)
    arr = []

    col_defs = DestinationDb.get_definition(table_name)

    col_defs.each do |col_def|
      arr << col_def[0]
    end

    return arr
  end

  def self.preview(table_name, rows)
    #todo: abstract based on adapter, right now being designed for mysql

    errors = Array.new

    # raise rows.inspect
    column_names = DestinationDb.get_column_names(table_name)
    cols_str = "(" + column_names.join(",") + ")"

    rows.each do |row|
      vals = []

      column_names.each do |col|

        if row[col]
          vals << "'" + row[col] + "'" 
        else
          #todo: handle more gracefully, output to results page
          errors << "Table '#{table_name}', column '#{col}' could not be mapped to" 
        end
      end

      vals_str = "(" + vals.join(",") + ")"
    end

    return errors.uniq
  end

  def self.insert_rows(table_name, rows)
    #todo: abstract based on adapter, right now being designed for mysql

    errors = []

    # raise rows.inspect
    column_names = DestinationDb.get_column_names(table_name)
    cols_str = "(" + column_names.join(",") + ")"

    rows.each do |row|
      vals = []

      column_names.each do |col|

        if row[col]
          vals << "'" + row[col] + "'" 
        else
          #todo: handle more gracefully, output to results page
          errors.add("Column '#{col}' not found")
        end
      end

      vals_str = "(" + vals.join(",") + ")"

      # raise "insert into #{table_name} #{cols_str} VALUES#{vals_str};".inspect

      DestinationDb.connection.execute("insert into #{table_name} #{cols_str} VALUES#{vals_str};")
      # DestinationDb.connection.execute("insert into posts (name) VALUES('test_insert');")
    end

    return errors
  end
end
