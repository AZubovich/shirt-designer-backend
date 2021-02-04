FactoryBot.define do
  factory :shirt do
    title { 'factoryShirt' }
    description { 'shirt description' }
    price { 1.11 }
    model { 'model' }
    association :user, factory: :user, strategy: :create

    after(:build) do |shirt|
      shirt.image = { data: 'data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAAUA
    				 AAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO
        			 9TXL0Y4OHwAAAABJRU5ErkJggg==' }
    end
  end
end