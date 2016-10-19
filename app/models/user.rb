class User < ActiveRecord::Base

  validates :name, presence: true

  has_many :chores
  belongs_to :apartment

end
