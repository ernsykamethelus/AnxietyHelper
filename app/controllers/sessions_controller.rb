class SessionsController < ApplicationController


    def index
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def new
    end

    def create
        #example to know if user exist in the system
        User.find_by(username: params[:user][:username])
        # did we find someone and did they put in the right password
        if @user && @user.authenticate(password: params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:error] = "Sorry, login info was incorrect. Please try again."
            redirect_to login_path
        end
    end
end


