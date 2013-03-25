class CreateMigrationRules < ActiveRecord::Migration
  def change
    create_table :migration_rules do |t|
      t.string :table_name

      t.timestamps
    end
  end
end
