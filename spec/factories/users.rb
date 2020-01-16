FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"芽瑠華李"}
    first_name            {"太郎"}
    family_name_kana      {"メルカリ"}
    first_name_kana       {"タロウ"}
    birth_year            {1}
    birth_month           {1}
    birth_day             {1}
  end

end