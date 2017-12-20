require "rails_helper"

describe "User visits user show  page" do

  it 'allows user  to edit ideas ' do
    user = User.create(username: "fern@gully.com",
                        password: "password",
                        role: 0)
    humor = user.categories.create!(name:"humor")
    drama = user.categories.create!(name:"drama")
    idea = user.ideas.create(title:'idea',category_id: humor.id,user_id: user.id)
    img = idea.images.create!(name:"first")
    img1 = idea.images.create!(name:"second")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit  user_path(user)

      fill_in 'idea[title]', with: "New Idea"
      fill_in 'idea[description]', with: 'Sexy Daipers'

      select "drama", :from => "idea[category_id]"
      select "first", :from => "idea[image_ids][]"

    click_on 'Edit'

    expect(current_path).to eq(edit_user_idea_path(user,idea))
    fill_in 'idea[title]', with: "Old Idea"
    fill_in 'idea[description]', with: 'Sexy Daipers'

    select "drama", :from => "idea[category_id]"
    select "second", :from => "idea[image_ids][]"

    click_on "Update Idea"

    expect(current_path).to eq(user_path(user))

      expect(page).to have_content("second")
    end

end
