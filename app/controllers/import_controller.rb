class ImportController < ApplicationController
  def analyze

    if params[:temp_db_table]
      @temp_db_data = TempDb.get_data(params[:temp_db_table])
    end

  end
end
