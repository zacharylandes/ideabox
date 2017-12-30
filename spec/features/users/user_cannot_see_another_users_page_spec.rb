require "rails_helper"

describe "User logs in do" do

  it 'does not allow a user to see another users page   ' do
     user = create(:user)
    humor = user.categories.create!(name:"humor")
    drama = user.categories.create!(name:"drama")
    idea = user.ideas.create(title:'idea',category_id: humor.id,user_id: user.id)
    img = idea.images.create!(name:"first")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit  user_path(user)

    visit user_path(2)

    expect(page).to have_content("doesn't exist")

    end
end
