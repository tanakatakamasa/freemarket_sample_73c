FactoryBot.define do
  factory :user do  
    # nickname          {"tana"}
    # e-mail             {"ttt@gmail.com"}
    # password          {"00000000"}  
    # encrypted_password{"00000000"}
    # birthday         {"1985-04-19"}
    # last_name        {"taka"}
    # last_name_kana   {"taka"}
    # first_name       {"tanaka"}
    # first_name_kana  {"tanaka"}
  end

  factory :category do  
    name              {1}
  end

  factory :product do  
    name              {"tomato"}
    price             {800}
    discription       {"aaa"}
    condition_id      {1}
    burden_id         {1}
    prefecture_id     {1}
    duration_id       {1}
    seller_id         {1}
    buyer_id          {1}
    category_id       {1}
  end

end
