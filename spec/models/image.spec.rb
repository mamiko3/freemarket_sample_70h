require 'rails_helper'
it "is invalid without a image" do
  image = build(:image,image: nil)
  image.vaild?
  expect(image.errors[:image]).to include("can't be blank")
end
