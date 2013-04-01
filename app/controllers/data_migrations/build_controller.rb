class DataMigrations::BuildController < ApplicationController
  include Wicked::Wizard

  steps :add_name, :dest_details, :src_details, :preview, :results

  def show
    @data_migration = DataMigration.find(params[:data_migration_id])

    if step == :preview
      #build migration preview
      @rows_preview, @preview_errors = @data_migration.preview_migration
    end

    render_wizard 
  end


  def update
    @data_migration = DataMigration.find(params[:data_migration_id])

    # raise step.inspect
    if step != :preview and step != :results
      @data_migration.update_attributes(params[:data_migration])
      @data_migration.save
      
    elsif step == :preview
      #perform actual migration
      @results = @data_migration.execute_migration
    end

    render_wizard @data_migration
  end

  def create
    @data_migration = DataMigration.create
    redirect_to wizard_path(steps.first, :data_migration_id => @data_migration.id)
  end
end