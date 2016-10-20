class Chore < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :user

  validates :name, presence: true
  validates :points, presence: true
  validates :points, numericality: { only_integer: true },
  validates :points, inclusion: 1...3,
  validates :completion_interval, numericality: { only_integer: true },
  validates :completion_interval, presence: true
  validates :apartment_id, presence: true

end
