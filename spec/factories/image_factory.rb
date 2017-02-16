#
include ActionDispatch::TestProcess

FactoryGirl.define do

  # Factory to test the image model
  factory :image do

    # Value attributes randomly
    tags  { Faker::Lorem.words(1..5) }
    media { fixture_file_upload('./spec/fixtures/test_image.jpg', 'image/jpg') }

  end

end