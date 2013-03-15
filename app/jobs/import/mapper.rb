module Import
  class Mapper
    attr_accessor :rows, :parser, :number_type_id

    def initialize(file, years)
      @parser = Parser.new(file)


      @rows = csv.map { |row| Row.new(file, row, map(years)) }
    end

    def update_municipalities
      existing = Muni.pluck(:id)
      new = rows.select { |row| !existing.include?(row.bfs_nr) }.select(&:valid?)
      Muni.import([:id, :name, :people, :agglo], new.map(&:municipality))
    end

    def update_number_kinds
      @number_type_id = parser.create_type
    end

    def update_numbers
      numbers = rows.select(&:valid?).map { |row| row.numbers(number_type_id).flatten }
      Number.import([:muni_id, :type_id, :year, :value], numbers)
    end

    private

    def csv
      parser.csv
    end

    def map(years)
      years.each_with_object({}) do |year, memo|
        memo[year] = [year, type_postfix].join(' ')
      end
    end

    def type_postfix
      @type_postfix ||= parser.unit == :percent ? "[PROZ]" : "[SFR]"
    end
  end
end
