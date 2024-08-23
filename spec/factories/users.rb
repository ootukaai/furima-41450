FactoryBot.define do
  factory :user do
    nickname              {"punpun"}
    email                 {Faker::Internet.email}
    password              {"barenai1"}
    password_confirmation {"barenai1"}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birthday              {Faker::Date.birthday}
  end
end