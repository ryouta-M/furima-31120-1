FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.last_name}
    first_name {'田中'}
    last_name {'太郎'}
    first_name_kana {'タナカ'}
    last_name_kana {'タロウ'}
    email {Faker::Internet.free_email}
    password  {'aaa1111'}
    password_confirmation {password}
    birth_date { '1930-01-01' }
  end
end