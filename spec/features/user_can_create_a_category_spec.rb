require "rails_helper"

@user = User.create(email: "f@f.com", password: 'password', password_confirmation: 'password')
category = Category.create(name: "social media", user_id: @user.id)
feature "user successfully adds a category" do
  scenario "authenticated user successfully adds a category" do
    visit user_session_path
    fill_in "Email", with: 'f@f.com'
    fill_in "Password", with: 'password'
    click_button "Log in"
    click_link "Create category"
    fill_in "Name", with: 'Coding Resources'
    click_button "Submit"
    click_link "Back"
    select("Coding Resources", from: 'Category')
  end
end
