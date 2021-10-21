class AddPointsAndWinnerToUserGames < ActiveRecord::Migration[6.1]
  def change
    add_column :user_games, :points, :integer
    add_column :user_games, :winner, :boolean
  end
end
