class Region < Struct.new(:id, :name)

  def self.find(id)
    @all.find { |region|  region.id == id }
  end
  def self.all
    @all ||= [
      Region.new(241, "Berner Jura"),
      Region.new(242, "Biel"),
      Region.new(243, "Seeland"),
      Region.new(244, "Oberaargau"),
      Region.new(245, "Emmental"),
      Region.new(246, "Bern Mittelland"),
      Region.new(247, "Thun"),
      Region.new(248, "Frutigen-Niedersimmental"),
      Region.new(249, "Obersimmental-Saanen"),
      Region.new(250, "Interlaken-Oberhasli"),
    ]
  end

end
