class CreateDataMigrations < ActiveRecord::Migration
  def change
    create_table :data_migrations do |t|

      t.timestamps
    end
  end
end
