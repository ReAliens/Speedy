FactoryBot.define do
  factory :jwt_denylist do
    jti { 'MyString' }
    exp { '2022-05-07 16:00:25' }
  end
end
