require 'spec_helper'
@user = User.create(email: "f@f.com", password: 'password', password_confirmation: 'password')
@bookmark = Bookmark.create(title: "reddit.com", url: 'http://www.reddit.com', user_id:@user.id)
describe "admins" do
  it "should not be able to delete themself" do
    expect{ delete :destroy, :id => 999999 }
    should set_the_flash[:alert].to("Error: Bar has not been deleted.")
  end
end
