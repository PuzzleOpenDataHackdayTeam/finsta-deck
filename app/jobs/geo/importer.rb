require 'csv'
module Geo
  class Importer
    def run
      csv = CSV.parse(File.read(Geo::FILE), headers: true)
      csv.each do |row|
        muni = Muni.find(row['id'])
        muni.update_attribute(:map, row['map'])
      end
    end
  end
end
