module Maps
  class GoogleStatic

    def url(muni)
      [base_url, query(muni.name).to_query].join('?')
    end

    private

    def base_url
      "http://maps.googleapis.com/maps/api/staticmap"
    end

    def query(name)
      {
        key: ENV['GOOGLE_API_KEY'],
        size: '290x200',
        sensor: 'false',
        zoom: '10',
        center: name,
        style: 'feature:administrative|element:geometry.stroke|color:0xea7810|saturation:100|lightness:100',
        markers: "size:mid|color:orange|#{name}",
        maptype: 'terrain'
      }
    end
  end
end
