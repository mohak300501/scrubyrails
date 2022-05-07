class UserController < ApplicationController
    require 'securerandom'
    before_action :set_user_variable

    def set_user_variable
        @user ||= User.find_by(email: session[:email]) if session[:email].present?
    end

    def profile
        if session[:user]
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
                session[:new_user] = {"name" => params[:name], "email" => params[:email], "password" => params[:password]}
                otp = SecureRandom.random_number(999999)
                session[:otp] = otp
                OtpMailer.with(otp: otp, email: params[:email]).otp_mail.deliver_later
                flash[:alert] = "The OTP has been sent to the above email address. Please enter it in the OTP field."
                redirect_to new_path
            else
                flash[:notice] = "Passwords do not match."
                redirect_to new_path
            end
        end
    end

    def otpp
        if params[:otp].to_i == session[:otp]
            nu = session[:new_user]
            user = User.new(:name => nu["name"], :email => nu["email"], :password => nu["password"])
            user.save
            session.delete(:otp)
            session.delete(:new_user)
            flash[:notice] = "Registered successfully! Login to continue."
            redirect_to user_login_path
        else
            flash[:alert] = "OTP does not match. Please re-enter carefully."
            redirect_to new_path
        end
    end

    def muserr
        if session[:member]
            @users = User.where(nil)
            keys = ["regid", "country", "state", "pin", "gender", "age", "sanslevel", "acadqual"]
            for i in keys
                @users = @users.filter_by_(i, params[i]) if params[i].present?
            end
            @count = @users.count
            render "users"
        else
            redirect_to root_url
        end
    end

    def muserdp
        if session[:member]
            user = User.find(params[:id])
            user.destroy
            redirect_to all_users_path
        else
            redirect_to root_url
        end
    end

    def uform
        if session[:user]
            render "uform"
        else
            flash[:alert] = "Please login as user first!"
            redirect_to user_login_path
        end
    end

    def uformp
        user = User.find_by(email: session[:email])
        pp = params[:user]
        user.update(:name => pp[:name], :email => pp[:email], :profile => true, :country => pp[:country],
                    :state => pp[:state], :pin => pp[:pin], :gender => pp[:gender], :age => pp[:age],
                    :mobile => pp[:mobile], :sanslevel => pp[:sanslevel], :acadqual => pp[:acadqual])
        session[:email] = pp[:email] if session[:email] != pp[:email]
        flash[:alert] = "Profile updated!"
        redirect_to profile_path
    end
end
