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

    self.get_dest_tables.each do |dest|      
      sample_row = DestinationDb.get_sample_row(dest)


      #pull data from appropriate mapping rules
      self.mapping_rules.where(:dest_table => dest).each do |rule|
        new_row = sample_row.clone
        data = SourceDb.get_data(rule.src_table)

        data.each do |row|
          new_row[rule.dest_column] = row[rule.src_column] 
        end

        rows_to_be_inserted << new_row
      end
    end

    # DestinationDb.insert_rows(rows_to_be_inserted)
    # raise rows_to_be_inserted.inspect
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
