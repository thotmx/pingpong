class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player, index: true, foreign_key: true
      t.references :opponent, index: true, foreign_key: true
      t.date :date_played
      t.integer :player_score
      t.integer :opponent_score

      t.timestamps null: false
    end
  end
end
