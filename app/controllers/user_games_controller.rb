class UserGamesController < ApplicationController

    def create
        # byebug
        players = params["players"]
        user_games_array = players.map do |player|
            new_user_game = UserGame.create!(user_id: player[:id], game_id: params[:gameId])
            # byebug
        end
        print user_games_array
        render json: user_games_array, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def user_game_params
        params.permit(:user_id, :game_id)
    end

end
