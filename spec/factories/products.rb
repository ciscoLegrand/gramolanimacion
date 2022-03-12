FactoryBot.define do
  factory :product do
    categories { nil }
    name { "MyString" }
    price { "9.99" }
    price_no_vat { "9.99" }
    price_in_cents { 1 }
  end
end
