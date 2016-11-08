class Apartment < ActiveRecord::Base
  has_many :users
  has_many :chores

  validates :name, presence: true
  validates :secret, presence: true
  validates :zip_code, presence: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }

end
