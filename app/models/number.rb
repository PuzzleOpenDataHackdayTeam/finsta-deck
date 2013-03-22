class Number < ActiveRecord::Base
  attr_accessible :municipality_id, :number_type_id, :value, :year
  belongs_to :type
  belongs_to :muni

  scope :valid, scoped.includes(:type).merge(Type.valid).where('value != 0')
end
