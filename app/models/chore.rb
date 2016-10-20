class Chore < ActiveRecord::Base

  POINTS = [
    [1, 'light chore'],
    [2, 'medium chore'],
    [3, 'heavy chore']
           ]

  belongs_to :apartment
  has_many :users

  validates :name, presence: true
  validates :points, presence: true
  # validates :points, numericality: { only_integer: true }
  # validates :points, inclusion: 1...3
  validates :completion_interval, numericality: { only_integer: true }
  validates :completion_interval, presence: true
  validates :apartment_id, presence: true

end
