require "test_helper"

class CanLogGameTest < Capybara::Rails::TestCase
  test "sanity" do
    user1 = User.create!(email: 'test1@mail.com', password: '12345678', password_confirmation: "12345678")
    user2 = User.create!(email: "test2@mail.com", password: "fake12345678", password_confirmation: "fake12345678")
    visit root_path

    fill_in "Email", with: "test1@mail.com"
    fill_in "Password", with: "12345678"

    click_button "Sign in"

    click_link "Log Game"

    page.must_have_content "This is a sample page"
  end
end
