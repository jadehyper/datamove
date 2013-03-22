class SourceDb < ActiveRecord::Base
  establish_connection(:development_src) #abstract db name based on env

  def self.get_tables
    return SourceDb.connection.tables
  end

  def self.get_data(table_name)
    return SourceDb.connection.select_all("select * from #{table_name};")
  end

  def self.get_definition(table_name)
    arr = []
    SourceDb.connection.execute("describe #{table_name};").each{|r| arr << r}

    return arr
  end
end