class Chore < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :user

  validates :name, presence: true
  validates :completion_interval, presence: true
  validates :apartment_id, presence: true
  validates :completion_interval, numericality: { only_integer: true },

end
