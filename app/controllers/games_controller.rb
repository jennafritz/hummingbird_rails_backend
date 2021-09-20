class GamesController < ApplicationController


    before_action :find_game, only: [:show, :update, :destroy]


    def index
        games = Game.all
        render json: games
    end
    
    def show
        render json: @game
    end

    def create
        game = Game.create(game_params)
        render json: game
    end

    def update
        @game.update(game_params)
        render json: @game
    end

    def destroy
        @game.destroy
        render json: "Game Deleted!!"
    end
    

    private

    def find_game
        @game = Game.find(params[:id])
    end

    def game_params
        params.permit(:name, :age)
    end


end
