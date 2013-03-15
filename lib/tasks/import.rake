desc 'import csv data' 
task :import => :environment do
  Import::Job.new.run
end
