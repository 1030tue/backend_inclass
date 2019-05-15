class Period < ApplicationRecord
  belongs_to :teacher
  has_many :trips
  has_many :enrolls
  has_many :students, :through => :enrolls
end
