class Scrape < ActiveRecord::Base
  attr_accessible :dump, :name

  mount_uploader :dump, SqldumpUploader
end
