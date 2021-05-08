FactoryBot.define do
  factory :room do
    group_name  {'ああああ'}
    species     {'ああああ'}
    first_work  {'ああああ'}
    first_text  {'ああああああ'}
    association :user

    after(:build) do |room|
      room.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end