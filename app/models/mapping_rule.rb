class MappingRule < ActiveRecord::Base
  attr_accessible :dest_column, :dest_table, :src_column, :src_table
  
end
