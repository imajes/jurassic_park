# frozen_string_literal: true

FactoryBot.define do
  factory :dinosaur do
    name  { Faker::Lorem.words(number: 2).join(' ') }

    trait :velociraptor do
      species { :velociraptor }
    end

    trait :trex do
      species { :tyrannosaurus }
    end

    trait :carnivore do
      species { Dinosaur::CARNIVORES.sample }
    end

    trait :herbivore do
      species { Dinosaur::HERBIVORES.sample }
    end
  end
end
