class UserGamesController < ApplicationController

    def create
        players = params["players"]
        user_games_array = players.map do |player|
            new_user_game = UserGame.create!(user_id: player[:id], game_id: params[:gameId], points: 0, winner: false)
        end
        render json: user_games_array, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def update_user_games
        final_user_games = params["finalUserGames"]
        updated_user_games = []
        final_user_games.each do |user_game|
            found_user_game = UserGame.find(user_game[:id])
            found_user_game.update!(points: user_game[:points], winner: user_game[:winner])
        end
        render json: {message: "Update Successful"}, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def user_game_params
        params.permit(:user_id, :game_id, :points, :winner)
    end

end
