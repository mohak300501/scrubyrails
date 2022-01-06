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

    moru = session[:moru] == "member" ? true : false
    def loginp
        @moru = moru ? Member.find_by(email: params[:email]) : User.find_by(email: params[:email])
        if @moru
            if @moru.password == params[:password]
                session[moru ? :member : :user ] = @moru.name
                redirect_to root_url
            else
                flash[:notice] = "Password does not match"
                redirect_to moru ? member_login_path : user_login_path
            end
        else
            flash[:notice] = "Email not found"
            redirect_to moru ? member_login_path : user_login_path
        end
    end

    def logout
        session.delete(moru ? :member : :user)
        redirect_to root_url
    end
end
