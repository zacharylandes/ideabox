require "rails_helper"

describe "User visits show page" do

  it 'allows visit  to delete ideas ' do
    user = User.create(username: "fern@gully.com",
                        password: "password",
                        role: 1)
    humor = user.categories.create!(name:"humor")
    drama = user.categories.create!(name:"drama")
    idea = user.ideas.create(title:'idea',category_id: humor.id,user_id: user.id)
    img = idea.images.create!(name:"first")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit  user_path(user)

    # byebug
    click_on 'Delete'

    expect(current_path).to eq(user_path(user))
    expect(Idea.count).to eq(0)

    end
end
