class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  # validation
  validates :nickname, length: { in: 1..15, message: 'は1〜15文字で記入してください'}, presence: true,on: :validates_step1
  validates :email, length: { maximum: 50, too_long: 'は50文字以内で記入してください'}, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: "は「***@***.***」で登録してください"},on: :validates_step1
  validates_uniqueness_of :email, message: 'は既に登録されています' ,on: :validates_step1
  validates :password, length: { in: 7..15, message: '6〜15文字で記入してください'}, presence: true,on: :validates_step1
  validates :last_name, presence: true,on: :validates_step1
  validates :first_name, presence: true,on: :validates_step1
  validates :last_name_kana, presence: true,on: :validates_step1
  validates :first_name_kana, presence: true,on: :validates_step1
  validates :birthday, presence: true,on: :validates_step1
  validates :phone_number, length: { in: 10..11, message: 'は10,11文字で記入してください'}, presence: true,on: :validates_step2
  validates_uniqueness_of :phone_number, message: 'は既に登録されています',on: :validates_step2

  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :card, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.new(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end