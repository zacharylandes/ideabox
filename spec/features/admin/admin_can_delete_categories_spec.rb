require "rails_helper"

describe "User visits categories index page" do

  it 'allows admin  to delete categories ' do
    admin = create(:user, role:1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit  new_admin_category_path
    fill_in "category[name]", with: "humor"
    click_on "Create Category"

    expect(Category.count).to eq(1)

    click_on 'Delete'

    expect(current_path).to eq(admin_categories_path)
    expect(Category.count).to eq(0)

    end
end
