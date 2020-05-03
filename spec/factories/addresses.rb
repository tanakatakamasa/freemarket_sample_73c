FactoryBot.define do

  factory :address do
    last_name             {"山田"}
    last_name_kana        {"太郎"}
    first_name            {"ヤマダ"}
    first_name_kana       {"タロウ"}
    postal_code           {"000-0000"}
    prefecture_id         {"1"}
    city                  {"渋谷区"}
    street                {"道玄坂"}
  end

end
