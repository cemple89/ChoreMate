class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :apartment_id, presence: true
  
  has_many :chores
  belongs_to :apartment

end
