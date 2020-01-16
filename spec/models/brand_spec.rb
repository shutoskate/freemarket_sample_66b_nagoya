require 'rails_helper'

RSpec.describe Brand, type: :model do
  it "名前が空白の場合" do
    brand = build(:brand, name: "")
    brand.valid?
    expect(brand.errors[:name]).to include("can't be blank")
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
