class PermanentDb < ActiveRecord::Base
  establish_connection(:development) #abstract db name based on env

  def self.get_tables
    return PermanentDb.connection.tables
  end

  def self.get_data(table_name)
    return PermanentDb.connection.select_all("select * from #{table_name};")
  end

  def self.get_definition(table_name)
    arr = []
    PermanentDb.connection.execute("describe #{table_name};").each{|r| arr << r}

    return arr
  end
end