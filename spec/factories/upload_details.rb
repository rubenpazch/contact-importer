FactoryBot.define do
  factory :upload_detail do
    row { 1 }
    column { 1 }
    data { "MyString" }
    error { "MyText" }
  end
end
