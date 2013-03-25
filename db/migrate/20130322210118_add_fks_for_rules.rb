class AddFksForRules < ActiveRecord::Migration
  def change
    add_column :migration_rules, :data_migration_id, :integer
    add_column :mapping_rules, :migration_rule_id, :integer
  end
end
