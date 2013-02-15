original_database = "original_db_dev" #todo: abstract
temp_database = "temp_db_dev"
username = "root"
password = ""
dest = Rails.root + 'tmp/'

namespace :db do
  
  #rake db:dump
  desc "dumps the original database to a sql file"
  task :dump => :environment do
    puts "Creating import_dump.sql file."

    # `mysqldump -u "#{username}"  --password="#{password}" "#{original_database}" > "#{dest + original_database}"_dump.sql`


    `mysqldump -u "#{username}" "#{original_database}" > #{dest}import_dump.sql`
  end
 


  #rake db:create RAILS_ENV=development_temp

  #rake db:dumpimport - Resets the DB.
  desc "imports the .sql file to temp_database"
  task :dumpimport, [:file] => [:environment, :reset] do |t, args|
# raise Rails.root.to_s
    dest = Rails.root.to_s + "/public" + args.file


    # `mysql -u "#{username}" --password="#{password}" "#{temp_database}" < "#{temp_database}"_dump.sql`
    `mysql -u "#{username}" "#{temp_database}" < #{dest}`
  end

  task :testargs, [:arg1, :arg2] => :environment do |t, args|
    puts args.inspect
  end
 
end