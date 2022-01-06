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
        @moru = session[:moru] == "member" ? Member.find_by(email: params[:email]) : User.find_by(email: params[:email])
        if @moru
            if @moru.password == params[:password]
                session[session[:moru] == "member" ? :member : :user ] = @moru.name
                session.delete(:moru)
                redirect_to root_url
            else
                flash[:notice] = "Password does not match"
                redirect_to logging_login_path
            end
        else
            flash[:notice] = "Email not found"
            redirect_to logging_login_path
        end
    end

    def logout
        session.delete(session[:moru] == "member" ? :member : :user)
        redirect_to root_url
    end
end
