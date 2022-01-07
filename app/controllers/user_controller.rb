class UserController < ApplicationController
    def profile
        if session[:user]
            @user = User.find_by(email: session[:email])
            render "profile"
        else
            redirect_to root_url
        end
    end

    def new
        if session[:user]
            redirect_to root_url
        else
            render "new"
        end
    end

    def newp
        if User.find_by(email: params[:email])
            flash[:notice] = "Email already registered."
            redirect_to new_path
        else
            if params[:password] == params[:repass]
                user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
                user.save
                flash[:notice] = "Registered successfully! Login to continue."
                redirect_to user_login_path
            else
                flash[:notice] = "Passwords do not match."
                redirect_to new_path
            end
        end
    end

    def usersr
        if session[:member]
            @users = User.all
            render "users"
        else
            redirect_to root_url
        end
    end
end
