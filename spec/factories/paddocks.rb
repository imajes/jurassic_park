FactoryBot.define do
  factory :paddock do
    name  { Faker::Lorem.words(number: 2).join(" ") }
    park { Park.first }
    capacity { (1...5).to_a.shuffle.first }
  end
end
