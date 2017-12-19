require 'rails_helper'
describe "admin logs in" do

    it "redirects to admin categories path" do
	   admin = User.create(username: "penelope",
                        password: "boom",
                        role: 1)

            visit '/login'

      fill_in "username", with: admin.username
      fill_in "password", with: admin.password

      click_on "Log In"


      expect(current_path).to eq(admin_categories_path)

      expect(page).to have_content("admin place")
    end


end
