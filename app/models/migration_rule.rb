class MigrationRule < ActiveRecord::Base
  attr_accessible :table_name

  has_many :mapping_rules, :dependent => :destroy
  accepts_nested_attributes_for :mapping_rules, :allow_destroy => true #, :reject_if => lambda { |a| a[:dest_table].blank? }
end
