FactoryBot.define do
  factory :post do
    caption "MyCaption"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/test_resources/images/betta_fish.jpg', 'image/jpg')
  end
end
