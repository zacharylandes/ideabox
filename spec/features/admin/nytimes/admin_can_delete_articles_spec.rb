require "rails_helper"

describe "admin can delete Ny Times articles " do
  context "when an admin goes to the article index page" do
    it "allows admin to see the delete an article" do
      admin = create(:user, role:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_categories_path

      fill_in "nytime[title]", with: "humor"
      click_on ("Find Article")

      expect(Nytime.count).to eq(1)

      expect(current_path).to eq(admin_categories_path)

      click_on "Delete"

      expect(current_path).to eq(admin_categories_path)
      expect(Nytime.count).to eq(0)
    end
  end
end
