# encoding: UTF-8
class Type < ActiveRecord::Base
  attr_accessible :name, :text, :unit

  scope :valid, where(id: [1, 5, 34, 38])

  def formatted_unit
    unit == 'percent' ? "%" : "CHF"
  end

  def to_s
    [id, name, formatted_unit].join(', ')
  end

  def pretty_name
    self.class.pretty_names[id]
  end

  def self.pretty_names
    { 1 => "Selbstfinanzierung",
      5 => "Verschuldungsanteil",
      34 => "Fremdkapital / Einwohner",
      38 => "Ausgaben pro Schüler" }
  end


end
