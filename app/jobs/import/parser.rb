require 'csv'
module Import
  class Parser
    attr_reader :id, :name, :text, :unit, :csv

    def initialize(file)
      prepare(File.read(file))
    end

    def create_type
      Type.import([:id, :name, :text, :unit],
                  [[id, name, text, unit]])
      id
    end

    def to_s
      "#{id} #{name} #{unit}"
    end

    private
    def prepare(data)
      split = data.index('BFS-Nr')
      meta, rows = data[0...split], data[split...-1]

      @name, @text = meta.split(";;;;;;;;;\n")
      @id = name.scan(/\d/).join.to_i
      @name = name.split(' ')[2..-1].join(' ')
      @text = @text.gsub("\n", " ").strip.gsub('Kurzbeschrieb: ', '')

      @csv = CSV.parse(rows.strip, options)
      @unit = csv.headers.join['PROZ'] ? :percent : :chf
    end

    def options
      { col_sep: ';', headers: true }
    end
  end
end
