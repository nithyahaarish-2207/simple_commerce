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
    #~ f.products: [build(:product), build(:product, :title => "test1", :price=>90)]
    association :product, factory: :product
    f.status "unfulfilled"
    #~ f.total_price [build(:product), build(:product, :title => "test1", :price=>90)].sum(&:price)
  end

end