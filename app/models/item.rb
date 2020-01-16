class Item < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :brand
  belongs_to :category
  has_many :likes
  has_many :comments
  has_many :item_imgs
  has_one :trade

  with_options presence: true do
    validates :name
    validates :size
    validates :price
    validates :seller_id
    validates :category_id
    validates :status
    validates :charge
    validates :trade_step
    validates :delivery
    validates :prefecture
    validates :term
  end
end
