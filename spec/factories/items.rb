FactoryBot.define do
  factory :category do
    name                  {"タンクトップ"}
  end

  factory :item do  
    name              {"tomato"}
    price             {800}
    discription       {"aaa"}
    condition_id      {1}
    burden_id         {1}
    prefecture_id     {1}
    duration_id       {1}
    seller_id         {1}
    buyer_id          {1}
    category_id       {231}
  end

end
