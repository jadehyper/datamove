class ImportController < ApplicationController
  def analyze
    src_table_name = params[:src_db_table]
    if src_table_name
      @src_db_data = SourceDb.get_data(src_table_name)
      @src_table_def = SourceDb.get_definition(src_table_name)
    end

    destination_table_name = params[:destination_db_table]
    if destination_table_name
      @destination_db_data = DestinationDb.get_data(destination_table_name)
      @destination_table_def = DestinationDb.get_definition(destination_table_name)
    end
  end

  def data_migrate
    src_table_name = params[:src_db_table]
    if src_table_name
      @src_db_data = SourceDb.get_data(src_table_name)
      @src_table_def = SourceDb.get_definition(src_table_name)
    end

    destination_table_name = params[:destination_db_table]
    if destination_table_name
      @destination_db_data = DestinationDb.get_data(destination_table_name)
      @destination_table_def = DestinationDb.get_definition(destination_table_name)
    end
  end

  def src_tab_cols
    src_table_name = params[:src_db_table]

    @src_table_def = []
    if src_table_name
      @src_db_data = SourceDb.get_data(src_table_name)
      all_column_defs = SourceDb.get_definition(src_table_name)

      all_column_defs.each do |col_def|
        @src_table_def << col_def[0]
      end
    end

    respond_to do |format|
      format.js
    end
  end

  
  def dest_tab_cols
    dest_table_name = params[:dest_db_table]

    @dest_table_def = []
    if dest_table_name
      @dest_db_data = DestinationDb.get_data(dest_table_name)
      all_column_defs = DestinationDb.get_definition(dest_table_name)

      all_column_defs.each do |col_def|
        @dest_table_def << col_def[0]
      end
    end

    respond_to do |format|
      format.js
    end
  end



end
