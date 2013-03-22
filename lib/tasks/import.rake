desc 'import csv data' 
task :import => :environment do
  Import::Job.new.run
end

task :svg => :environment do
  target = Rails.root.join('app', 'views', 'application', '_bern.html')
  config = Rails.root.join('db','osm','bern.verwaltungsbezirke.json')

  sh "kartograph --format svg --output #{target} #{config}"
end
