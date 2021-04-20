FactoryBot.define do
  factory :order_address do
    postal_code    {"123-4567"}
    prefectures_id {2}
    city           {"横浜市"}
    number         {"青山１−１"}
    building_name  {"ほげビル3F"}
    phone_number   {"09012345678"}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
