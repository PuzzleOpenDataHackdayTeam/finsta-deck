require 'geocoder'
module Geo
  class Resolver
    def run
      results = Muni.all.map do |muni|
        result = Geocoder.search(muni.name).first
        google = Geocoder::Lookup.get(:google)
        puts muni
        sleep 0.3
        if result
          lat, long = result && result.coordinates
          map = google.map_link_url(result.coordinates)
          { id: muni.id, lat: lat, long: long, map: map }
        end
      end.compact

      data = CSV.generate do |csv|
        csv << results.first.keys
        results.each do |result|
          csv << result.values
        end
      end
      File.write(Geo::FILE, data)
    end
  end
end
