class Chore < ActiveRecord::Base

  POINTS = [
    [1, 'light chore'],
    [2, 'medium chore'],
    [3, 'heavy chore'],
    [4, 'intense chore']
           ]

  belongs_to :apartment
  belongs_to :user

  validates :name, presence: true
  validates :points, presence: true
  validates :completion_interval, numericality: { only_integer: true }
  validates :completion_interval, presence: true
  validates :apartment_id, presence: true

end
