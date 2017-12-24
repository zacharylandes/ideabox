require 'rails_helper'
describe "User" do
  context 'user selects an article ' do
    context 'user can click on the article to view it' do
      it 'selects an article' do

       user = create(:user)
        humor = user.categories.create!(name:"humor")
        drama = user.categories.create!(name:"drama")
        idea = user.ideas.create(title:'idea',category_id: humor.id,user_id: user.id)
        img = idea.images.create!(name:"first")
        gid = idea.gifs.create!(name:"gify")
        nytime = idea.nytimes.create!(title:"new article", url:"https://nytimes.com")

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
        select "new article", :from => "idea[nytime_ids][]"

        click_on 'Create Idea'

        expect(current_path).to eq(user_path(user))

        first("a[href='#{user_idea_path(user,idea)}']").click

        expect(current_path).to eq(user_idea_path(user,idea))
        expect(page).to have_content("new article")
       end
      it 'can go back to the user show page after viewing  an article' do

       user = create(:user)
        humor = user.categories.create!(name:"humor")
        drama = user.categories.create!(name:"drama")
        idea = user.ideas.create(title:'idea',category_id: humor.id,user_id: user.id)
        img = idea.images.create!(name:"first")
        gid = idea.gifs.create!(name:"gify")
        nytime = idea.nytimes.create!(title:"new article", url:"https://nytimes.com")

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
        select "new article", :from => "idea[nytime_ids][]"

        click_on 'Create Idea'

        expect(current_path).to eq(user_path(user))

        first("a[href='#{user_idea_path(user,idea)}']").click

        click_on "Back to your Ideas"
        expect(current_path).to eq(user_path(user))
       end
    end
  end
end
