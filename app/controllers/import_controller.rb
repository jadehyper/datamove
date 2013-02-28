class ImportController < ApplicationController
  def analyze
    table_name = params[:temp_db_table]


    if table_name
      @temp_db_data = TempDb.get_data(table_name)
      @table_def = TempDb.get_definition(table_name)
    end


  end
end
