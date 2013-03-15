class Muni < ActiveRecord::Base
  attr_accessible :name, :agglo, :people
  has_many :numbers

  def self.load(ids)
    ids =  ids.map(&:to_i)
    all = Muni.where(id: ids).each_with_object({}) do |muni, memo|
      memo[muni.id] = muni
    end
    ids.map { |id| all[id] }
  end

  def agglo?
    agglo && agglo != id
  end

  def to_s
    name
  end

  def value(type_id)
    numbers.where(type_id: type_id).first
  end

end
