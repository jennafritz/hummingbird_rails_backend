class UsersController < ApplicationController

    before_action :find_user, only: [:show, :update, :destroy]

    # after_action :after_run(@results)

    def index
        # puts "Index action!!"
        # byebug
        # puts "End of action!!"
        # @name = "Vidhi" # to show in rails view

        # @results = User.all
        users = User.all
        render json: users

        # after_run(results)
    end
    
    def show
        # byebug
        # user = User.find(params[:id])
        # user = User.find_by(username: params[:user_name])
        render json: @user
    end

    def create
        # byebug
        user = User.create(owner_params)
        render json: user
    end

    def update
        # byebug
        # user = User.find(params[:id])
        # user = find_owner
        @user.update(owner_params)
        render json: @user
    end

    def destroy
        # byebug
        @user.destroy
        render json: "User Deleted!!"
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:name, :age)
    end

    # def after_run(results)
    #     # puts "After Action!!!"
    #     render json: results
    # end 


end
