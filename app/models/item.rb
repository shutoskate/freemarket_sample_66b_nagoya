class Item < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :brand
  belongs_to :category
  has_many :likes
  has_many :comments
  has_many :item_imgs, dependent: :destroy
  has_one :trade

  accepts_nested_attributes_for :item_imgs, allow_destroy: true

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
    validates :item_text
  end

  extend Enumerize

  @brands = Brand.all
  brand_list = {}
  @brands.each do |brand|
    brand_list.merge!(brand.name => brand.id)
  end
  enumerize :brand_id, in: brand_list

  enum status:{
    "新品未使用":1,"未使用に近い":2,"目立った傷や汚れ無し":3,"やや傷や汚れあり":4,"傷や汚れあり":5,"全体的に状態が悪い":6
  }

  enum charge:{
    "送料込み（出品者負担）":1,"着払い（購入者負担）":2
  }

  enum delivery_1:{
    "未定":1,"ラクラク便":2,"ゆうメール":3,"レターパック":4,"普通郵便（定型・定形外）":5,"クロネコヤマト":6,"ゆうパック":7,"クリックポスト":8
  }

  # enum delivery_2:{
  #   "未定 ":1,"ゆうメール ":2,"ゆうパック ":3,"クロネコヤマト ":4
  # }

  enum term:{
    "1~2日で発送":1, "2~3日で発送":2, "4~7日で発送":3
  }

  enum prefecture:{北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
  茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
  新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
  岐阜県:21,静岡県:22,愛知県:23,三重県:24,
  滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
  鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
  徳島県:36,香川県:37,愛媛県:38,高知県:39,
  福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

  enum size:{ 
    "サイズなし":0, "XXS以下":1, "XS(SS)":2, "S":3, "M":4, "L":5, "XL(LL)":6, "2XL(3L)":7, "3XL(4L)":8, "4XL(5L)以上":9, "FREE SIZE":10 
  }

  enum trade_step:{
    "出品中":1, "交渉中":2, "出品停止":3 
  }
end