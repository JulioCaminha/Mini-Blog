FactoryGirl.define do
  factory :user do
    username 'NewUser'
    email 'johndofe@org.com'
    password '12345678'
    password_confirmation '12345678'
    # if needed
    # is_active true
  end

end
