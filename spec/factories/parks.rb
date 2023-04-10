FactoryBot.define do
  factory :isla_nublar do
    name { "Jurassic Park" }
    host_country { "Costa Rica" }
    lat { 9.803167 }
    lng { -88.611917 }
    corporate_entity { "InGen" }
    online { true }
    launched_at { Date.parse("1983-8-11") }
  end

  factory :isla_sorna do
    name { "Site B" }
    host_country { "Costa Rica" }
    lat { 9.644369 }
    lng { -88.441497 }
    corporate_entity { "InGen" }
    online { false }
  end
end
