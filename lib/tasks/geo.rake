namespace :geo do
  desc 'try to map geo data'
  task :resolve => :environment do
    Geo::Resolver.new.run
  end

  task :import => :environment do
    Geo::Importer.new.run
  end
end
