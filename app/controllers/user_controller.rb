class UserController < ApplicationController
    require 'securerandom'
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
                session[:new_user] = {"name" => params[:name], "email" => params[:email], "password" => params[:password]}
                otp = SecureRandom.random_number(999999)
                session[:otp] = otp
                OtpMailer.with(otp: otp, email: params[:email]).otp_mail.deliver_later
                flash[:alert] = "The OTP has been sent to the above email address. Please enter it the OTP field."
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
            @user = User.where(nil)
            if params[:country].present?
                @user = @user.filter_by_country(params[:country])
            end
            if params[:state] != ''
                @user = @user.filter_by_state(params[:state])
                @country = User.where(nil)
            end
            if params[:pin] != ''
                @user = @user.filter_by_pin(params[:pin])
            end
            if params[:gender] != ''
                @user = @user.filter_by_gender(params[:gender])
            end
            if params[:age] != ''
                @user = @user.filter_by_age(params[:age])
            end
            if params[:sanslevel] != ''
                @user = @user.filter_by_sanslevel(params[:sanslevel])
            end
            if params[:acadqual] != ''
                @user = @user.filter_by_acadqual(params[:acadqual])
            end
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
        session[:email] = params[:email]
        flash[:alert] = "Profile updated!"
        redirect_to profile_path
    end
end
