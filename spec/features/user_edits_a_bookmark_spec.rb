require "rails_helper"

@user = User.create(email: "f@f.com", password: 'password', password_confirmation: 'password')
category = Category.create(name: "social media", user_id: @user.id)
feature "user successfully edits a bookmark" do
  scenario "authenticated user successfully edits a bookmark" do
    visit user_session_path
    fill_in "Email", with: 'f@f.com'
    fill_in "Password", with: 'password'
    click_button "Log in"
    fill_in "Title", with: "Reddit"
    fill_in "Url", with: "http://wwww.reddit.com"
    fill_in "Description", with: "A collection of sites. Users upvote and downvote sites"
    select("social media", from: 'Category')
    click_button "Create Bookmark"
    click_link "Edit"
    fill_in "Title", with: "Reddit Web Dev"
    fill_in "Url", with: "http://www.reddit.com/r/webdev/"
    click_button "Update Bookmark"
    expect(page).to have_content("Reddit Web Dev")
  end
end
