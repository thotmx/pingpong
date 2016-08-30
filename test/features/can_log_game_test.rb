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

    fill_in "game_date_played", with: "2016/01/01"
    select "test2@mail.com", from: "Opponent"  
    fill_in "Your score", with: "21"
    fill_in "Their score", with: "19"
    click_button "Save"

    page.must_have_content "The game was saved!"
  end
end
