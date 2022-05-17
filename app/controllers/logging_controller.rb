class LoggingController < ApplicationController
    def unew
        if session[:user]
            redirect_to root_url
        else
            session[:moru] = "user"
            render "new"
        end
    end

    def mnew
        main_mem = Rails.application.credentials.mail[:MAIL_USERNAME]
        if session[:member] and session[:email] != main_mem
            redirect_to home_path
        elsif session[:email] == main_mem
            session[:moru] = "member"
            render "new"
        else
            redirect_to root_url
        end
    end

    def newp
        ifmoru = session[:moru] == "member" ? true : false
        moru = ifmoru ? Member.find_by(email: params[:email]) : User.find_by(email: params[:email])
        if moru
            if params[:email] == Rails.application.credentials.member[:MEMBER_EMAIL] and ifmoru
                flash[:notice] = Rails.application.credentials.member[:MEMBER_MESSAGE].split("/").join(" ")
                session.delete(:member)
                session.delete(:email)
                redirect_to member_login_path
            else
                flash[:notice] = "Email already registered."
                redirect_to ifmoru ? new_member_path : new_user_path
            end
        else
            if params[:password] == params[:repass]
                session[:new_moru] = {"name" => params[:name], "email" => params[:email], "password" => params[:password]}
                otp = SecureRandom.random_number(999999)
                session[:otp] = otp
                OtpMailer.with(otp: otp, email: params[:email]).otp_mail.deliver_later
                flash[:alert] = "An OTP has been sent to " + params[:email] + ". Please enter it in the OTP field."
                redirect_to ifmoru ? new_member_path : new_user_path
            else
                flash[:notice] = "Passwords do not match."
                redirect_to ifmoru ? new_member_path : new_user_path
            end
        end
    end

    def otpp
        if params[:otp].to_i == session[:otp]
            nmoru = session[:new_moru]
            ifmoru = session[:moru] == "member" ? true : false
            session.delete(:otp)
            session.delete(:new_moru)
            if ifmoru
                member = Member.new(:name => nmoru["name"], :email => nmoru["email"], :password => nmoru["password"])
                member.save
                flash[:notice] = "Registered successfully! Login to continue."
                session.delete(:member)
                session.delete(:email)
                redirect_to member_login_path
            else
                user = User.new(:name => nmoru["name"], :email => nmoru["email"], :password => nmoru["password"])
                user.save
                flash[:notice] = "Registered successfully! Login to continue."
                redirect_to user_login_path
            end 
        else
            flash[:alert] = "OTP does not match. Please re-enter carefully."
            redirect_to ifmoru ? new_member_path : new_user_path
        end
    end

    def mlogin
        if session[:member]
            redirect_to home_path
        else
            session[:moru] = "member"
            render "login"
        end
    end

    def ulogin
        if session[:user]
            redirect_to root_url
        else
            session[:moru] = "user"
            render "login"
        end
    end

    def loginp
        ifmoru = session[:moru] == "member" ? true : false
        moru = ifmoru ? Member.find_by(email: params[:email]) : User.find_by(email: params[:email])
        if moru
            if moru.password == params[:password]
                session[ifmoru ? :member : :user ] = moru.name
                session[:email] = moru.email
                flash[:notice] = "Logged in!"
                redirect_to ifmoru ? home_path : root_url
            else
                if params[:email] == Rails.application.credentials.member[:MEMBER_EMAIL] and ifmoru
                    flash[:notice] = Rails.application.credentials.member[:MEMBER_MESSAGE].split("/").join(" ")
                else
                    flash[:notice] = "Incorrect password!"
                end
                redirect_to ifmoru ? member_login_path : user_login_path
            end
        else
            flash[:notice] = "Email not found."
            redirect_to ifmoru ? member_login_path : user_login_path
        end
    end

    def logout
        ifmoru = session[:moru] == "member" ? true : false
        session.delete(ifmoru ? :member : :user)
        session.delete(:email)
        redirect_to root_url
    end

    def forgot
        if session[:moru]
            render "reset"
        else
            redirect_to root_url
        end
    end

    def forgotp
        ifmoru = session[:moru] == "member" ? true : false
        moru = ifmoru ? Member.find_by(email: params[:email]) : User.find_by(email: params[:email])
        if moru
            session[:femail] = params[:email]
            fotp = SecureRandom.random_number(999999)
            session[:fotp] = fotp
            FotpMailer.with(fotp: fotp, email: params[:email]).fotp_mail.deliver_later
            flash[:alert] = "An OTP has been sent to " + params[:email] + ". Please enter it in the OTP field."
            redirect_to forgot_path
        else
            flash[:notice] = "Email not found."
            redirect_to forgot_path
        end
    end
    
    def resetp
        if params[:fotp].to_i == session[:fotp]
            if params[:password] == params[:repass]
                email = session[:femail]
                ifmoru = session[:moru] == "member" ? true : false
                session.delete(:fotp)
                session.delete(:femail)
                moru = ifmoru ? Member.find_by(email: params[:email]) : User.find_by(email: params[:email])
                moru.update(:password => params[:password])
                flash[:notice] = "Password reset successfully. Please login to continue."
                redirect_to ifmoru ? member_login_path : user_login_path
            else
                flash[:notice] = "Passwords do not match."
                redirect_to forgot_path
            end
        else
            flash[:alert] = "OTP does not match. Please re-enter carefully."
            redirect_to forgot_path
        end
    end
end
