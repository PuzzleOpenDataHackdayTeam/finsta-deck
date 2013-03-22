module Import

  class Job
    def run
      years = (2002..2011)
      Muni.destroy_all
      Type.destroy_all
      Number.destroy_all
      valid_files.each do |file|
        mapper = Mapper.new(file, [2011])
        puts mapper.parser
        mapper.update_municipalities
        mapper.update_number_kinds
        mapper.update_numbers
      end
    end

    private

    def files
      @files ||= Rails.root.join('db','csv').children.select { |child| child.extname == '.csv' }.sort
    end

    # 01 = selbstfinanzierungsgrad
    # 05 = bruttoverschuldungsanteil
    # 34 = FK / Einwohner (chf)
    # 38 = Ausgaben pro schüler (chf)
    def valid_files
      files.select { |file| file.basename.to_s =~ /KZ(01|05|34|38)/ }
    end
  end
end

