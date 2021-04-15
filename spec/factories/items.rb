FactoryBot.define do
  factory :item do

    name           {"名前"}
    category_id    {2}
    price          {5000}
    status_id      {2}
    fee_id         {2}
    prefectures_id {2}
    day_id        {2}
    description    {"説明"}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/pexels-photo-2199140.jpeg'), filename: 'pexels-photo-2199140.jpeg')
    end
  end
end
