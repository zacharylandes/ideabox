require 'rails_helper'
describe "User" do
  describe '.methods' do
    it 'signs up ' do

  user = User.create(username: "funbucket13", password: "test", role:0)
  humor = user.categories.create!(name:"humor")
  drama = user.categories.create!(name:"drama")

  visit '/'

  click_on "I already have an account"

  expect(current_path).to eq(login_path)

  fill_in "username", with: user.username
  fill_in "password", with: user.password

  click_on "Log In"

  expect(current_path).to eq(user_path(user))
  expect(page).to have_content("What's your idea?")

  fill_in 'idea[title]', with: "New Idea"
  fill_in 'idea[description]', with: 'Sexy Daipers'
  click_on 'Create Idea'

  expect(current_path).to eq(user_path(user))
  expect(page).to have_content("Sexy Daipers")
    end
  end
end
