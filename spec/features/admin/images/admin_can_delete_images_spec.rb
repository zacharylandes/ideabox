require "rails_helper"

describe "User visits categories index page" do

  it 'allows admin  to delete images ' do
    admin = create(:user, role:1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    attach_file('image[image]', File.absolute_path('app/assets/images/polygon.png'))
    click_on ("Create Image")

    expect(Image.count).to eq(1)

    click_on 'Delete'

    expect(current_path).to eq(admin_categories_path)
    expect(Image.count).to eq(0)

    end
end
