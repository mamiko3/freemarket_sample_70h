require 'rails_helper'
describe Item do   
    describe '#search' do
          # 何も検索フォームに値が入っていない場合
       it "is invalid without a  search"do
              
              item = create(:item)
  
            #   expect(Item.all).to eq(Item.search(""))
            expect(Item.all).to eq(Item.search(nil))
       end
            # 検索した商品名があった場合
      it "is invalid without a  search"do
          item = create(:item,name: "あああ")

          items = item[:name]
          tests = Item.where('name LIKE(?)', "あああ").first
          binding.pry
          expect(items).to eq(tests.name)
       end
          # 検索した商品名がなかった場合
      it "is invalid without a  search"do
          item = create(:item, name: "aaa") #aaa商品を作成（保存はしていない）
          items=[]
          expect(items).to eq(Item.where('name LIKE(?)', "ああああ"))
          #itemと検索結果が一致しているかを検証
    end
  end
end
