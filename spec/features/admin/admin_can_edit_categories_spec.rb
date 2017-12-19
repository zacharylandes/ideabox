require "rails_helper"

describe "User visits categories index page" do

  it 'allows admin  to edit categories ' do
    admin = User.create(username: "fern@gully.com",
                        password: "password",
                        role: 1)
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit  new_admin_category_path
    fill_in "category[name]", with: "humor"
    click_on "Create Category"

    # byebug
    click_on 'Edit'

    expect(current_path).to eq(edit_admin_category_path(Category.last))
      fill_in "category[name]", with: "comedy"

      click_on 'Update Category'
      expect(page).to have_content("comedy")
    end

end
