class ImportController < ApplicationController
  def analyze
    temp_table_name = params[:temp_db_table]
    if temp_table_name
      @temp_db_data = TempDb.get_data(temp_table_name)
      @temp_table_def = TempDb.get_definition(temp_table_name)
    end

    permanent_table_name = params[:permanent_db_table]
    if permanent_table_name
      @permanent_db_data = PermanentDb.get_data(permanent_table_name)
      @permanent_table_def = PermanentDb.get_definition(permanent_table_name)
    end
  end

  def data_migrate
    temp_table_name = params[:temp_db_table]
    if temp_table_name
      @temp_db_data = TempDb.get_data(temp_table_name)
      @temp_table_def = TempDb.get_definition(temp_table_name)
    end

    permanent_table_name = params[:permanent_db_table]
    if permanent_table_name
      @permanent_db_data = PermanentDb.get_data(permanent_table_name)
      @permanent_table_def = PermanentDb.get_definition(permanent_table_name)
    end
  end

  def temp_tab_cols
    temp_table_name = params[:temp_db_table]
    if temp_table_name
      @temp_db_data = TempDb.get_data(temp_table_name)
      @temp_table_def = TempDb.get_definition(temp_table_name)
    end

    respond_to do |format|
      format.js
    end
  end

end
