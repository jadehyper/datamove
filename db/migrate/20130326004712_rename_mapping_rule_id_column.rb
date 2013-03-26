class RenameMappingRuleIdColumn < ActiveRecord::Migration
  def change
    rename_column :mapping_rules, :mapping_rule_id, :data_migration_id
  end

end
