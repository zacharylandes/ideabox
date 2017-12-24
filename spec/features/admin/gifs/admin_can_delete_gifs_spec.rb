require "rails_helper"

describe "User visits categories index page" do

  it 'allows admin  to delete gifs ' do
    admin = create(:user, role:1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    fill_in "gif[name]", with: "burrito"

    click_on ("Create Gif")
    
    expect(Gif.count).to eq(1)

    click_on 'Delete'

    expect(current_path).to eq(admin_categories_path)
    expect(Gif.count).to eq(0)

    end
end
