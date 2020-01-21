class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :trades
  has_many :comments
  has_many :likes
  has_many :addresses
  has_many :cards
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
