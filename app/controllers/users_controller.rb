class UsersController < ApplicationController

    def new 
        redirect_to user_path(current_user.id) if logged_in?
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user) 
        else 
            render :new
        end
    end

    def edit 
        redirect_to_if_not_required
        @user = User.find_by_id(params[:id])
    end

    def index 
        require_user
        @user = User.all
    end

    def update 
        redirect_to_if_not_required
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else 
            render 'edit'
        end
    end

    def show 
        require_user
        @user = User.find_by_id(params[:id])
        redirect_to "/" if !@user
    end

    private 
    
    def user_params
        params.require(:user).permit(:username, :email, :password, session[:user_id])
    end
end
