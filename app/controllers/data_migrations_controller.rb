class DataMigrationsController < ApplicationController
  # GET /data_migrations
  # GET /data_migrations.json
  def index
    @data_migrations = DataMigration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_migrations }
    end
  end

  # GET /data_migrations/1
  # GET /data_migrations/1.json
  def show
    @data_migration = DataMigration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_migration }
    end
  end

  # GET /data_migrations/new
  # GET /data_migrations/new.json
  def new
    @data_migration = DataMigration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_migration }
    end
  end

  # GET /data_migrations/1/edit
  def edit
    @data_migration = DataMigration.find(params[:id])
  end

  # POST /data_migrations
  # POST /data_migrations.json
  def create
    @data_migration = DataMigration.new(params[:data_migration])

    respond_to do |format|
      if @data_migration.save
        # format.html { redirect_to data_migrations_wizard_path }
      else
        format.html { render action: "new" }
        format.json { render json: @data_migration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data_migrations/1
  # PUT /data_migrations/1.json
  def update
    @data_migration = DataMigration.find(params[:id])

    respond_to do |format|
      if @data_migration.update_attributes(params[:data_migration])
        format.html { redirect_to @data_migration, notice: 'Data migration was successfully updated.', :action => :put }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_migration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_migrations/1
  # DELETE /data_migrations/1.json
  def destroy
    @data_migration = DataMigration.find(params[:id])
    @data_migration.destroy

    respond_to do |format|
      format.html { redirect_to data_migrations_url }
      format.json { head :no_content }
    end
  end
end
