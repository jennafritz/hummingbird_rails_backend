class GamesController < ApplicationController


    before_action :find_game, only: [:show, :update, :destroy]


    def create
        new_game = Game.create!(game_params)
        render json: new_game, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def game_params
        params.permit(:name)
    end

end
