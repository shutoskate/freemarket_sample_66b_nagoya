class Address < ApplicationRecord

  belongs_to :user, optional: true

  with_options presence: true do
    validates :post_code
    validates :prefecture
    validates :city
    validates :address
  end
end
