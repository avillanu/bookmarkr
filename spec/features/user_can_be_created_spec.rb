require "rails_helper"
feature "user can signup and login" do
  scenario "user can sign up and login" do
    visit user_session_path
    click_link "Sign up"
    fill_in "Email", with: 'zf@zf.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign up"
    expect(page).to have_content "Description"
    click_link "Sign out"
    page.should_not have_content("Description")
  end
end
