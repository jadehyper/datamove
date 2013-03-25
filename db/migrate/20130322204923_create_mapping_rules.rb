class CreateMappingRules < ActiveRecord::Migration
  def change
    create_table :mapping_rules do |t|
      t.string :src_table
      t.string :src_column
      t.string :dest_table
      t.string :dest_column

      t.timestamps
    end
  end
end
