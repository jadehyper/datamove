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
end