FactoryBot.define do

  factory :image do
    item_image    {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/food_jambalaya.png'))}
  end
end

