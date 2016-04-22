require "rails_helper"

@user = User.create(email: "f@f.com", password: 'password', password_confirmation: 'password')
category = Category.create(name: "social media", user_id: @user.id)
feature "user tries unsuccessful to add an incomplete category" do
  scenario "user tries unsuccessfully to add an incomplete a category" do
    visit user_session_path
    fill_in "Email", with: 'f@f.com'
    fill_in "Password", with: 'password'
    click_button "Log in"
    click_link "Create category"
    click_button "Submit"
    expect(page).to have_content("Name can't be blank")
  end
end
