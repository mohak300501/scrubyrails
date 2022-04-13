class UserController < ApplicationController
    def profile
        if session[:user]
            @user = User.find_by(email: session[:email])
            # @profile = false
            # if User.column_names.include? 'profile'
            #     @profile = true
            # end
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

    def muserr
        if session[:member]
            @users = User.all
            render "users"
        else
            redirect_to root_url
        end
    end

    def uform
        if session[:user]
            @user = User.find_by(email: session[:email])
            render "uform"
        else
            flash[:alert] = "Please login as user first!"
            redirect_to user_login_path
        end
    end

    def uformp
        user = User.find_by(email: session[:email])
        user.update(:name => params[:name], :email => params[:email], :profile => true, :country => params[:country],
                    :state => params[:state], :pin => params[:pin], :gender => params[:gender], :age => params[:age],
                    :mobile => params[:mobile], :sanslevel => params[:sanslevel], :acadqual => params[:acadqual])
        flash[:alert] = "Profile updated!"
        redirect_to profile_path
    end
end
