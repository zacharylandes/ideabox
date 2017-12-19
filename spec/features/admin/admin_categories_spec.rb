require "rails_helper"

describe "User visits categories index page" do

  it 'allows admin  to create categories ' do
    admin = User.create(username: "fern@gully.com",
                        password: "password",
                        role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit  new_admin_category_path
    fill_in "category[name]", with: "humor"
    click_on "Create Category"

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("humor")
    end

end
