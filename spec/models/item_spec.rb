require 'rails_helper'
describe Item do
  describe '#create' do
  it "is valid with a name,price,explain,postage,region,condition,shipping"do
    expect(build(:item)).to be_valid
  end
  it "is invalid without a name" do
    item = build(:item,name: nil)
    item.valid?
    expect(item.errors[:name]).to include("を入力してください")
  end
  it "is invalid without a price" do
    item = build(:item,price: nil)
    item.valid?
    expect(item.errors[:price]).to include("を入力してください", "は一覧にありません")
  end
  it "is invalid without a explain" do
    item = build(:item, explain: nil)
    item.errors
    expect(item.errors[:explain]).to include()
  end

  it "is invalid without a postage" do
    item = build(:item,postage: nil)
    item.valid?
    expect(item.errors[:postage]).to include("を入力してください")
  end

  it "is invalid without a region" do
    item = build(:item,region: nil)
    item.valid?
    expect(item.errors[:region]).to include("を入力してください")
  end

  it "is invalid without a condition" do
    item = build(:item, condition: nil)
    item.valid?
    expect(item.errors[:condition]).to include("を入力してください")
  end

  it "is invalid without a shipping" do
    item = build(:item, shipping: nil)
    item.valid?
    expect(item.errors[:shipping]).to include("を入力してください")
  end
  it "is valid with a name that has less than 40 characters " do
    item = build(:item, name: "aaaaaa")
    expect(item).to be_valid
  end

  it "is valid with a explain that has less than 1000 characters " do
    item = build(:item, explain: "aaaaaa")
    expect(item).to be_valid
  end

  it "is valid with a explain that has less than 1000 characters " do
    item = build(:item, explain: "aaaaaa")
    expect(item).to be_valid
  end
 it "is valid with a price that has less than inclusion: 300..9999999"do
  item = build(:item, price: 300)
  expect(item).to be_valid
end
end
end
