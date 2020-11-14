FactoryBot.define do
  factory :order_address do
    post_code { '111-1111' }
    prefecture_id { 1 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building {}
    phone_number { '09009090909' }
    token { 'tok_aaaaaaaaaaa00000000000000000' }
  end
end