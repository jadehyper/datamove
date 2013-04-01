class DataMigration < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :migration_rules_attributes
  attr_accessible :mapping_rules_attributes

  has_many :migration_rules, :dependent => :destroy
  accepts_nested_attributes_for :migration_rules, :allow_destroy => true#, :reject_if => lambda { |a| a[:table_name].blank? }


  has_many :mapping_rules, :dependent => :destroy
  accepts_nested_attributes_for :mapping_rules, :allow_destroy => true #, :reject_if => lambda { |a| a[:dest_table].blank? }
  
  def execute_migration
    rows_to_be_inserted = []

    self.get_dest_tables.each do |dest_tbl|      
      sample_row = DestinationDb.get_sample_row(dest_tbl)



      #pull data from appropriate mapping rules
      first_rule = self.mapping_rules.where(:dest_table => dest_tbl).first #this mapping rule is the "first" rule, needs to be merged with other rules below

      data = SourceDb.get_data(first_rule.src_table)

      # raise data.inspect
      data.each do |row|
        mapping_rules_used = Array.new
        mapping_rules_used << first_rule.id 

        new_row = sample_row.clone

        new_row[first_rule.dest_column] = row[first_rule.src_column] 

        #merge with other rules
        self.mapping_rules.where(:dest_table => dest_tbl, :src_table => first_rule.src_table).each do |other_rule|
          if !mapping_rules_used.include?(other_rule.id)
            mapping_rules_used << other_rule.id 

            new_row[other_rule.dest_column] = row[other_rule.src_column] 
          end
        end

        rows_to_be_inserted << new_row
      end

      # raise rows_to_be_inserted.inspect

      DestinationDb.insert_rows(dest_tbl, rows_to_be_inserted)
    end
  end



  def get_dest_tables
    arr = []
    self.mapping_rules.each do |rule|
      arr << rule.dest_table    
    end
    arr.uniq!

    return arr
  end

end 
