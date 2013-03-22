original_database = "dest_db_dev" #todo: abstract
temp_database = "src_db_dev"
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
 

  #rake db:recreate
  desc "drops and recreates the database"
  task :recreate => :environment do
    puts "Creating import_dump.sql file."

    # `mysqldump -u "#{username}"  --password="#{password}" "#{original_database}" > "#{dest + original_database}"_dump.sql`


    `mysqldump -u "#{username}" "#{original_database}" > #{dest}import_dump.sql`
  end

  #rake db:dumpimport - Resets the DB.
  desc "imports the .sql file to temp_database"
  task :dumpimport, [:file] => [:environment, :reset] do |t, args|
# raise Rails.root.to_s
    dest = Rails.root.to_s + "/public" + args.file


    # `mysql -u "#{username}" --password="#{password}" "#{temp_database}" < "#{temp_database}"_dump.sql`
    `mysql -u "#{username}" "#{temp_database}" < #{dest}`
  end
 
end