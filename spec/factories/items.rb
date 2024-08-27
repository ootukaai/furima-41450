FactoryBot.define do
  factory :item do
    name                 {"punpun"}
    feature              {"とてもいい商品です。"}
    category_id          {2}
    status_id            {2}
    shipping_free_id     {2}
    address_id           {2}
    shipping_day_id      {2}
    price                {100000}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
