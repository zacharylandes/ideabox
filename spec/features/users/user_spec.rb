require 'rails_helper'
describe User do
  describe 'user authentication' do
    it 'signs up ' do
      visit '/'

  click_on "Sign Up to Be a User"

  expect(current_path).to eq(new_user_path)
  fill_in "user[username]", with: "funbucket13"
  fill_in "user[password]", with: "test"

  click_on "Create User"

  expect(page).to have_content("Welcome, funbucket13!")
    end
  end

  describe 'already logged in' do
    it 'is already logged in' do

    user = User.create(username: "funbucket13", password: "test")

    visit '/'

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, funbucket13!")
    expect(page).to have_content("Logout")
    end

    it "can be created as an admin" do
      user = User.create(username: "penelope",
                         password: "boom",
                         role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "can be created as a default user" do
      user = User.create(username: "sammy",
                         password: "pass",
                         role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end
end
