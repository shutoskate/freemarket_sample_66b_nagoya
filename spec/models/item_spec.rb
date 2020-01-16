require 'rails_helper'
require 'brand'
require 'category'

describe Item do
  describe '#create' do
    it "名前が空白の場合" do
      user = create(:user)
      brand = create(:brand)
      category = create(:category)
      item = build(:item, name: "", seller_id: user.id, brand_id: brand.id, category_id: category.id)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    it "保存できるか否か" do
      user = create(:user)
      brand = create(:brand)
      category = create(:category)
      item = build(:item, seller_id: user.id, brand_id: brand.id, category_id: category.id)
      expect(item).to be_valid
    end
  end
end