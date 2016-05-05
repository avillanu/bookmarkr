require "rails_helper"

@user = User.create(email: "f@f.com", password: 'password', password_confirmation: 'password')
category = Category.create(name: "social media", user_id: @user.id)
feature "user successfully creates a bookmark" do
  scenario "authenticated user successfully creates a bookmark" do
    visit user_session_path
    fill_in "Email", with: 'f@f.com'
    fill_in "Password", with: 'password'
    click_button "Log in"
    fill_in "Title", with: "Reddit"
    fill_in "Url", with: "http://wwww.reddit.com"
    fill_in "Notes", with: "A collection of sites. Users upvote and downvote sites"
    select("social media", from: 'Category')
    click_button "Create Bookmark"
    expect(page).to have_content("Reddit")
  end
end
