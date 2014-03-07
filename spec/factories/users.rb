FactoryGirl.define do
  factory :user do
    email 'hello@invisiblelines.com'
    password 'authed'
    image_authentication_enabled true
  end
end
