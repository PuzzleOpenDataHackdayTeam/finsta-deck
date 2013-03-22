class Wikipedia
  attr_reader :target

  def fetch
    `wget http://de.wikipedia.org/wiki/Gemeinden_des_Kantons_Bern --output-document=#{target}`
  end

  def target
    @target ||= Rails.root.join('tmp', 'Gemeinden_des_Kantons_Bern')
  end

  def parse
    Parser.new(target)
  end

  class Parser
    require 'csv'

    attr_reader :rows

    def initialize(file)
      data = Nokogiri::HTML(File.read(file))
      @rows = data.css('.wikitable').each_with_object([]) do |table, memo|
        memo.concat(map(only_rows(table)))
      end
      write_csv
    end

    def write_csv
      data = CSV.generate do |csv|
        csv << %w(name link flag)
        rows.each do |row|
          csv << row
        end
      end
      File.write(csv_file, data)
    end

    def csv_file
      Rails.root.join('db','csv','wiki.csv')
    end

    def only_rows(table)
      rows = table.css('tr')
      rows.shift # ignore headers
      rows
    end

    def map(rows)
      rows.map do |row|
        columns = row.css('td')
        {
          name: columns[1].content,
          link: columns[1].css('a').first[:href],
          flag: columns[0].css('img').first[:src]
        }.values
      end
    end
  end
end
