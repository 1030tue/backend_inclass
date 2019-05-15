class Student < ApplicationRecord
  has_many :periods, :through=>:enrolls
  has_many :trips
  has_many :enrolls

end
