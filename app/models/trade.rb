class Trade < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item

  enum rating:{
    "評価待ち":0, "GOOD":1, "NORMAL":2, "BAD":3
  }
end
