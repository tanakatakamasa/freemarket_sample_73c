FactoryBot.define do

  factory :user do
    nickname              {"choru"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    last_name             {"山田"}
    last_name_kana        {"太郎"}
    first_name            {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"2020-04-30"}
  end

end