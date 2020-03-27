FactoryBot.define do

  factory :item do
    name              {"abe"}
    price             {"300000"}
    explain           {"あああああああああああああああああああああああ"}
    postage           {"0"}
    region            {"神奈川"}
    condition         {"未使用に近い"}
    shipping          {"１〜２日で発送"}
    user             
    category          
    category_id         {"1"}
  end

  

end