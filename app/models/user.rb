class User < ActiveRecord::Base


  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.chorescore = 0
      user.apartment_id = 1
      user.save!
    end
  end

  validates :name, presence: true
  validates :chorescore, numericality: { only_integer: true }

  has_many :chores
  belongs_to :apartment
end
