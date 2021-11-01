class UsersController < ApplicationController

    before_action :find_user, only: [:show, :update, :destroy]
    skip_before_action :authorized, only: [:create, :login]

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
        # user = User.find_by(username: params[:username])
        # if user
        #     render json: {error: "This username is taken"}
        # else
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
        @user = User.create!(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: {user: UserSerializer.new(@user), token: @token}, status: :created
        end
        rescue ActiveRecord::RecordInvalid => invalid
            render json: {message: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def update_users
        users = params["playersArray"]
        updated_users = []
        users.each do |player|
            user = User.find_by(id: player[:user_id])
            new_points = user[:points] + player[:points]
            if user
                user.update!(points: new_points)
                updated_users << user
            end
        end
        render json: updated_users, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    # def update
    #     user = User.find_by(id: params[:id])
    #     if user
    #         user.update!(user_params)
    #         render json: user, status: :ok
    #     else
    #         render json: {error: "User not found"}
    #     end
    # end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user), token: token}, status: :accepted
        else 
            render json: {error: "Invalid Username or Password"}, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:username, :password, :points)
    end

end
