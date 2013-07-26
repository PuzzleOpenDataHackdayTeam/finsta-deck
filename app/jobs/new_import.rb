require "csv"
module NewImport
  class Value
    attr_reader :value, :index

    class << self
      attr_accessor :indicators, :descriptions, :units
    end

    def initialize(value, index)
      @value = value.to_i
      @index = index.to_i
    end

    %w(indicator description unit).each do |method|
      define_method(method, -> { self.class.send("#{method}s")[index] })
    end
  end

  class Card
    attr_reader :row

    def initialize(row)
      @row = row
    end

    %w(id name).each_with_index do |method, index|
      define_method(method, -> { row[index + 1].send(method == 'id' ? :to_i : :to_s) })
    end

    def values
      row[3..-1].each_with_index.map { |value, index|  Value.new(value, index) }
    end
  end

  class Parser
    attr_reader :file, :csv

    def initialize(file)
      @file = file
      parse
    end

    def parse
      data = File.read(file)
      @csv = CSV.parse(data, { col_sep: ';' })

      %w(indicators units descriptions).each_with_index do |method, index|
        Value.send("#{method}=", csv[index][3..-1])
      end
    end

    def cards
      csv[4..-1].map { |row| Card.new(row) }
    end

    %w(indicators units descriptions).each_with_index do |method, index|
      define_method(method, -> { csv[index][3..-1] } )
    end
  end
end
