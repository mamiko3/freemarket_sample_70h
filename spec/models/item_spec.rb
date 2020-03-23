require 'rails_helper'
describe Item do
    
    describe '#search' do
          # 何も検索フォームに値が入っていない場合
       it "is invalid without a  search"do
              item = build(:item, name: nil)
              expect(item).to eq(Item.all)
       end
            # 検索した商品名があった場合
      it "is invalid without a  search"do
          item = create(:item,name: "あああ")
          expect(item).to eq(Item.search("あああ"))
       end
          # 検索した商品名がなかった場合
      it "is invalid without a  search"do
          item = build(:item, name: "カカカカカカカカカカかカカかかかk")
          expect(item).to eq(Item.where('name LIKE(?)', "%#{search}%"))
      end
      
    end
  end