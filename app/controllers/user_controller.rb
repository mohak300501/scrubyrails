class UserController < ApplicationController
    def profile
        if session[:user]
            @user = User.find_by(email: session[:email])
            render "profile"
        else
            redirect_to root_url
        end
    end
end
