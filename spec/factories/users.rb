FactoryBot.define do
  factory :user do
    
    nick_name {Faker::Name.last_name}
    first_name {person.first.kanji}
    last_name {person.last.kanji}
    first_name_kana {person.first.katakana}
    last_name_kana {person.last.katakana}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date {Faker::Date.between(form: '1930-01-01', to: '2015-12-31') }
  end
end