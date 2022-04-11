class LoggingController < ApplicationController
    def mlogin
        if session[:member]
            redirect_to root_url
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
        moru = session[:moru] == "member" ? true : false
        @moru = moru ? Member.find_by(email: params[:email]) : User.find_by(email: params[:email])
        if @moru
            if @moru.password == params[:password]
                session[moru ? :member : :user ] = @moru.name
                session[:email] = @moru.email
                redirect_to root_url
            else
                flash[:notice] = "Incorrect password!"
                redirect_to moru ? member_login_path : user_login_path
            end
        else
            flash[:notice] = "Email not found."
            redirect_to moru ? member_login_path : user_login_path
        end
    end

    def logout
        moru = session[:moru] == "member" ? true : false
        session.delete(moru ? :member : :user)
        session.delete(:email)
        redirect_to root_url
    end
end
