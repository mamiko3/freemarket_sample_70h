require 'rails_helper'
describe Item do   
    describe '#search' do
          # 何も検索フォームに値が入っていない場合
       it "is invalid without a  search"do
              item = create(:item)
              expect(Item.all).to eq(Item.search(""))
       end
            # 検索した商品名があった場合
      it "is invalid without a  search"do
          item = create(:item,name: "あああ")
          expect(item).to eq(Item.search("あああ"))
       end
          # 検索した商品名がなかった場合
      it "is invalid without a  search"do
          item = create(:item, name: "aaa") #aaa商品を作成（保存はしていない）
          a=[]
          expect(a).to eq(Item.where('name LIKE(?)', "ああああ"))
          #itemと検索結果が一致しているかを検証
    end
  end
end
