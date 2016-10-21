class User < ActiveRecord::Base

  validates :name, presence: true
  validates :chorescore, numericality: { only_integer: true }
  


  has_many :chores
  belongs_to :apartment

end
