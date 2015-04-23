require 'rails_helper'
require 'user'

RSpec.describe User, type: :model do
  it "should have a name" do
		user = User.create(username: nil, email: "johndoe@example.org" , password: "12345678")
		expect(user.errors.full_messages[0]).to eq("Username can't be blank")
	end

	it "should have an email" do
		user = User.create(username: "John Doe", email: nil , password: "12345678")
		expect(user.errors.full_messages[0]).to eq("Email can't be blank")
	end

	it "should have a valid email" do
		user = User.create(username: "John Doe", email: "johndoe@Doe", password: "12345678")
		expect(user.errors.full_messages[0]).to eq("Email is invalid")
	end

	it "should have a password" do
		user = User.create(username: "John Doe", email: "johndoe@example.org", password: nil)
		expect(user.errors.full_messages[0]).to eq("Password can't be blank")
	end

	it "should have a valid password" do
		user = User.create(username: "John Doe", email: "johndoe@example.org", password: "123")
		expect(user.errors.full_messages[0]).to eq("Password is too short (minimum is 8 characters)")
	end

	it "password should match password confirmation" do
		user = User.create(username: "John Doe", email: "johndoe@example.org", password: "12345678", password_confirmation: "12345679")
		expect(user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
	end
end
