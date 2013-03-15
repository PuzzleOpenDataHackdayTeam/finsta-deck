module Import
  class Row
    attr_reader :file, :name, :bfs_nr, :years, :municipality_id,
      :people, :agglo, :years, :row


    def initialize(file, row, years)
      @file = Pathname.new(file).basename
      @years = years

      @row = row
      @name = row['Gemeinde']
      @bfs_nr = row['BFS-Nr.'].to_i
      @people = row['Anzahl Einwohner'].to_i
      @agglo = row['Agglomeration BFS-Nr.']
    end


    def valid?
      if people == 0
        logger.info("#{name} has no people")
      end
      people > 5000
    end

    def municipality
      [bfs_nr, name, people, agglo]
    end

    def numbers(number_type_id)
      years.map do |key, value|
        logger.info("#{name}: #{key} is 0")
        [bfs_nr, number_type_id, key, row[value]]
      end
    end

    def logger
      @logger ||= begin
                    l = Logger.new(Rails.root.join('log','row.log'))
                    l.formatter = proc {|severity, datetime, progname, msg| "#{file}: #{msg}\n" }
                    l
                  end
    end

  end
end
