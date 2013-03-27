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

    #raise arr.inspect 
    #example: {"id"=>"", "name"=>"", "title"=>"", "content"=>"", "created_at"=>"", "updated_at"=>""}
    
    return arr
  end
end