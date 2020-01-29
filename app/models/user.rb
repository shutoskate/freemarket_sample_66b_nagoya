class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise   :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]  
  has_many :items
  has_many :trades
  has_many :comments
  has_many :likes
  has_many :addresses
  has_many :cards
  has_many :sns_credentials, dependent: :destroy
  validates :nickname, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  # has_many :active_relationships, class_name: “Relationship”, foreign_key: “follower_id”
  # has_many :passive_relationships, class_name: “Relationship”, foreign_key: “followed_id”

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,20}+\z/i
  validates :password,  format: { with: VALID_PASSWORD_REGEX }

  VALID_NAMEKANA_REGEX = /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/
  validates :family_name_kana, format: { with: VALID_NAMEKANA_REGEX}
  validates :first_name_kana, format: { with: VALID_NAMEKANA_REGEX}

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  
  year_list = {}
  for i in 0..120 do
    year = 2020 - i
    year_list.merge!(year.to_s => i)
  end
  enum birth_year:year_list

  enum birth_month:{
    "1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"10":10,"11":11,"12":12
  }

end
