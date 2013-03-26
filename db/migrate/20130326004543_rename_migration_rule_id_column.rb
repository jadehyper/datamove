class RenameMigrationRuleIdColumn < ActiveRecord::Migration
  def change
    rename_column :mapping_rules, :migration_rule_id, :mapping_rule_id
  end
end
