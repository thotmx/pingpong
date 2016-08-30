require "test_helper"

class CanShowHistory < Capybara::Rails::TestCase
  test "show correctly the history" do 
    user1 = create(:user, email: 'test1@mail.com')
    user2 = create(:user, email: "test2@mail.com")
    user3 = create(:user, email: "test3@mail.com")

    create(:game, player: user1, opponent: user2, player_score: 21, opponent_score: 19)
    create(:game, player: user2, opponent: user1, player_score: 21, opponent_score: 19)
    create(:game, player: user2, opponent: user1, player_score: 19, opponent_score: 21)
    create(:game, player: user1, opponent: user3, player_score: 19, opponent_score: 21)
    create(:game, player: user2, opponent: user3, player_score: 19, opponent_score: 21)

    visit root_path
    fill_in "Email", with: "test1@mail.com"
    fill_in "Password", with: "12345678"
    click_button "Sign in"


    click_link "History"

    page.must_have_content user2.email, count: 3 
    page.must_have_content user3.email
    page.must_have_content "Win", count: 2
    page.must_have_content "Lose"
  end
end
