class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: %i(google)

  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :card, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  protected
  def self.find_for_google(auth)
   user = User.find_by(email: auth.info.email)
   

    unless user
      user = User.create(
        nickname: auth.info.name,
        provider: auth.provider,
        uid:      auth.uid,
        token:    auth.credentials.token,
        password: Devise.friendly_token[0, 20],
        meta:     auth.to_yaml
      )
    end
    user
  end
end
