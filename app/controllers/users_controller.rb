class UsersController < ApplicationController

    before_action :find_user, only: [:show, :update, :destroy]

    # removed the following in lieu of JWT auth

    # def check_user_pass
    #     user = User.find_by(username: params[:username], password: params[:password])
    #     if user
    #         render json: user
    #     else
    #         render json: {error: "User does not exist"}
    #     end
    # end

    # def check_user
    #     user = User.find_by(username: params[:username])
    #     if user
    #         render json: {error: "This username is taken"}
    #     else
    #         render json: {error: "User does not exist"}
    #     end
    # end

    def leaderboard
        leaderboard = User.all.order("points DESC")[0, 10]
        render json: leaderboard, status: :ok 
    end

    def index
        users = User.all
        render json: users
    end

    def create
        new_user = User.create!(user_params)
        render json: new_user
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {message: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def update
        user = User.find_by(id: params[:id])
        if user
            user.update!(user_params)
            render json: user, status: :ok
        else
            render json: {error: "User not found"}
        end
    end

    private

    def user_params
        params.permit(:username, :password, :points)
    end

end
