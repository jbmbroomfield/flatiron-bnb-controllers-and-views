class UsersController < ApplicationController

    def index
        @hosts = User.all.filter { |user| user.is_host }
        @other_users = User.all.filter { |user| !user.is_host }
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to @user
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end

end
