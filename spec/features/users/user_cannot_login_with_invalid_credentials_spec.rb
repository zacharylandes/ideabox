require 'rails_helper'
describe "User login" do
    it "can logged_in " do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      click_on 'Login'
      fill_in "username", with: 1
      fill_in "password", with: 1

      click_on 'Log In'

      expect(current_path).to eq('/login')
      expect(page).to have_content("Invalid Credentials")

    end
  end
