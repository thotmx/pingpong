FactoryGirl.define do
  factory :game do
    player { build(:user)  }
    opponent { build(:user) }
    date_played { Date.today }
    player_score 21
    opponent_score 19 
  end
end

