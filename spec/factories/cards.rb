FactoryBot.define do
  factory :card do
    
    customer_id { "test" }
    card_id { "test" }

    association :user, factory: :user
  end
end