arr = [
  ['4242424242424242','Visa'], 
  ['4000056655665556','Visa (debit)'], 
  ['5555555555554444','Mastercard'],
  ['378282246310005','American Express'],
  ['371449635398431','American Express'],
  ['6011111111111117','Discover'],
  ['6011000990139424','Discover'],
  ['3056930009020004','Dinner Club'],
  ['36227206271667','Diners Club (14 digit card)'],
  ['3566002020360505','JCB'],
  ['6200000000000005','UnionPay']
]

FactoryBot.define do
  factory :contact do
    name  { Faker::Name.name }
    date_of_birth { Faker::Date.between(from: '1959-09-23', to: '2001-09-25') }
    phone  { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    address { Faker::Address.full_address }
    credit_card  { arr[rand(0..arr.length-1)][0] } 
    franchise { "" }
    email { Faker::Internet.email }
    user
  end
end
