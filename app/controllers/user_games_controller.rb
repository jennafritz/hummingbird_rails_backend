class UserGamesController < ApplicationController

    def create
        new_user_game = UserGame.create!(user_game_params)
        render json: new_user_game, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def user_game_params
        params.permit(:user_id, :game_id)
    end

end
