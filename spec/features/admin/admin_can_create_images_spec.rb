require "rails_helper"

describe "admin can create images " do
  context "as admin" do
    it "allows admin to see all images" do
	   admin = User.create(username: "penelope",
                        password: "boom",
                        role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_image_path
      attach_file('image[image]', File.absolute_path('app/assets/images/polygon.png'))
      click_on ("Create Image")

      expect(current_path).to eq(admin_categories_path)
      page.find('img')['src'].should have_content 'polygon.png'

    end
  end
end
