class Apartment < ActiveRecord::Base
  has_many :users
  has_many :chores

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }

end
