require "rails_helper"

describe "admin can create gifs " do
  context "when a user is an admin" do
    it "allows admin to see add an image" do
	   admin = User.create(username: "penelope",
                        password: "boom",
                        role: 1)
# byebug
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      fill_in "gif[name]", with: "humor"
      click_on ("Create Gif")

      expect(current_path).to eq(admin_categories_path)
      page.find('img')['src'].should have_content '.gif'
    end
  end
end
