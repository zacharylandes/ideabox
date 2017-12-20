require 'rails_helper'
describe "User" do
  context 'user logs in' do
    it 'selects an image from available images' do

     user = create(:user)
      humor = user.categories.create!(name:"humor")
      drama = user.categories.create!(name:"drama")
      idea = user.ideas.create(title:'idea',category_id: humor.id,user_id: user.id)
      img = idea.images.create!(name:"first")
      gid = idea.gifs.create!(name:"gify")

      visit '/'

      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in "username", with: user.username
      fill_in "password", with: user.password

      click_on "Log In"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("New idea?")

      fill_in 'idea[title]', with: "New Idea"
      fill_in 'idea[description]', with: 'Sexy Daipers'

      select "drama", :from => "idea[category_id]"
      select "first", :from => "idea[image_ids][]"

      select "gify", :from => "idea[gif_ids][]"


      click_on 'Create Idea'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Sexy Daipers")
      expect(page).to have_content("first")
    end
  end
end
