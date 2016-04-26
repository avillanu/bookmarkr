require "rails_helper"

@user = User.create(email: "f@f.com", password: 'password', password_confirmation: 'password')

feature "user unsuccessfully makes a login attempt" do
  scenario "user unsuccessfully makes a login attempt" do
    visit user_session_path
    fill_in "Email", with: 'f@f.com'
    fill_in "Password", with: 'wrongpassword'
    click_button "Log in"
    expect(page).to have_content("Invalid email or password.")
  end
end
