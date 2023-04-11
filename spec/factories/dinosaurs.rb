FactoryBot.define do
  factory :dinosaur do
    name  { Faker::Lorem.words(number: 2).join(" ") }

    trait :velociraptor do
      species { :velociraptor }
    end

    trait :carnivore do
      species { Dinosaur::CARNIVORES.shuffle.first }
    end

    trait :herbivore do
      species { Dinosaur::HERBIVORES.shuffle.first }
    end
  end
end
