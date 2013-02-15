class CreateScrapes < ActiveRecord::Migration
  def change
    create_table :scrapes do |t|
      t.string :name
      t.string :dump

      t.timestamps
    end
  end
end
