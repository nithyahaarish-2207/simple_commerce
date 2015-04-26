FactoryGirl.define do
  factory :user do |f|
    f.email "nithyahaarish@gmail.com"
    f.full_name "nithyahaarish"
    f.password "nithyahaarish"
    f.password_confirmation "nithyahaarish"
  end
  factory :product do |f|
    f.title "test"
    f.description "testing purposes"
    f.price "85"
  end
  factory :order do |f|
    product = [FactoryGirl.create(:product), FactoryGirl.create(:product, :title =>"test2")]
    f.products product
    f.total_price 54
    f.status false
  end
end