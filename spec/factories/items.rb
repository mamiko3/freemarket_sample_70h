FactoryBot.define do

  factory :item do
    name              {"abe"}
    price             {"300000"}
    explain           {"あああああああああああああああああああああああ"}
    postage           {"0"}
    region            {"神奈川"}
    condition         {"未使用に近い"}
    shipping          {"１〜２日で発送"}
    user_id           {"1"}
    id                {"1"}
    buyer_id          {"1"}
    created_at        {"1"}
    updated_at        {"1"}
  end

end