namespace :wiki do
  task :fetch => :environment do
    Wikipedia.new.fetch
  end

  task :parse => :environment do
    Wikipedia.new.parse
  end
end
