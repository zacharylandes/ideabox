require 'rails_helper'
describe "User logs out" do
    it "can logout " do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_on 'Logout'
      expect(current_path).to eq('/')
    end
  end
