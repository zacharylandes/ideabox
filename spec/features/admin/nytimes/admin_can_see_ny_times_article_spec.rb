require "rails_helper"

describe "admin can create Ny Times articles " do
  context "when an admin searches for an article" do
    it "allows admin to see the article " do
      admin = create(:user, role:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_categories_path

      fill_in "nytime[title]", with: "humor"
      click_on ("Find Article")

      expect(current_path).to eq(admin_categories_path)

      within(".image-show") do
        first('a').click
      end

      expect(current_path).to eq(admin_nytime_path(Nytime.first))
      expect(page).to have_content("humor")
    end
  end
end
