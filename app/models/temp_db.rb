class TempDb < ActiveRecord::Base
  establish_connection(:development_temp) #abstract db name based on env

  def self.get_tables
    return TempDb.connection.tables
  end

  def self.get_data(table_name)
    return TempDb.connection.select_all("select * from #{table_name};")
  end

  def self.get_definition(table_name)
    arr = []
    TempDb.connection.execute("describe #{table_name};").each{|r| arr << r}

    return arr
  end
end