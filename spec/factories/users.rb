FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    image                 {"http://test.jp"}
    email                 {"aaa@bbb"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"ああ"}
    last_name             {"ああ"}
    first_name_kana       {"ああ"}
    last_name_kana        {"ああ"}
    phone_number          {"2020/02/20"}
    year_birth_at         {"2020/02/20"}
    month_birth_at        {"2020/02/20"}
    day_birth_at          {"2020/02/20"}
    
  end

end