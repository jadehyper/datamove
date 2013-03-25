class AddNameToDataMigrations < ActiveRecord::Migration
  def change
    add_column :data_migrations, :name, :string
  end
end
