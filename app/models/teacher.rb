class Teacher < ApplicationRecord
  has_many :periods
  has_many :students, :through=>:periods

 validates :email, uniqueness: true
  has_secure_password
end
