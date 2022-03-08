FactoryBot.define do
  factory :legal_text do
    title { "Políticas de privacidad" }
    contenten {
      Faker::Lorem.paragraphs(240).join("\n\n")
    }
  end
end
