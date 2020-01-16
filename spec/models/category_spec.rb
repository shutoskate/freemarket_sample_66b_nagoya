require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with fullfilled" do
    category = build(:category)
    expect(category).to be_valid
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
