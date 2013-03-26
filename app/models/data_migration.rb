class DataMigration < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :migration_rules_attributes
  attr_accessible :mapping_rules_attributes

  has_many :migration_rules, :dependent => :destroy
  accepts_nested_attributes_for :migration_rules, :allow_destroy => true#, :reject_if => lambda { |a| a[:table_name].blank? }


  has_many :mapping_rules, :dependent => :destroy
  accepts_nested_attributes_for :mapping_rules, :allow_destroy => true #, :reject_if => lambda { |a| a[:dest_table].blank? }
end 
