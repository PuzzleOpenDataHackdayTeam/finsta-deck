desc 'import csv data' 
task :import => :environment do
  Import::Job.new.run
end

task :svg => :environment do
  target = Rails.root.join('app', 'views', 'application', '_bern.html')
  config = Rails.root.join('db','osm','bern.verwaltungsbezirke.json')

  sh "kartograph --format svg --output #{target} #{config}"
end

desc "import according to new spec" 
task :import_new => :environment do
  file = File.expand_path('../../../db/output_dataformat_stadtZH_v01.csv', __FILE__)
  parser = NewImport::Parser.new(file)
  parser.parse


  Muni.destroy_all
  Type.destroy_all
  Number.destroy_all

  cards = parser.cards
  munis = cards.map { |card| Muni.new(name: card.name) } 
  
  types = cards.first.values.map do |value|
    Type.new(name: value.indicator, text: value.description, unit: value.unit)
  end

  Muni.import(munis)
  Type.import(types)

  numbers = cards.map do |card|
    muni = Muni.find_by_name(card.name)
    card.values.map do |value|
      number = Number.new(value: value.value)
      number.muni = muni
      number.type = Type.find_by_name(value.indicator)
      number
    end
  end.flatten
  Number.import(numbers)
end
