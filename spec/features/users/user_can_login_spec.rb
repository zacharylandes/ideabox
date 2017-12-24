require 'rails_helper'
describe "User login" do
    it "can logged_in " do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      click_on 'Login'
      fill_in "username", with: user.username
      fill_in "password", with: user.password

      click_on 'Log In'

      expect(current_path).to eq(user_path(user))
    end
  end
