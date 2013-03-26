class DataMigrations::BuildController < ApplicationController
  include Wicked::Wizard

  steps :add_name, :dest_details, :src_details 

  def show
    @data_migration = DataMigration.find(params[:data_migration_id])

    render_wizard 
  end


  def update
    @data_migration = DataMigration.find(params[:data_migration_id])
    @data_migration.update_attributes(params[:data_migration])
    @data_migration.save

    render_wizard @data_migration
  end

  def create
    @data_migration = DataMigration.create
    redirect_to wizard_path(steps.first, :data_migration_id => @data_migration.id)
  end
end