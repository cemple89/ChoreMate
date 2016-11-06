class User < ActiveRecord::Base
  include Invitation::User



  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.chorescore = 0
      user.apartment_id = nil
      user.save!
    end
  end

  validates :name, presence: true
  validates :chorescore, numericality: { only_integer: true }

  belongs_to :apartment, optional: true
  has_many :chores


end
