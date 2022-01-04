class LoggingController < ApplicationController
    def login
    end
    def loginp
        @admin = Member.find_by(email: params[:email])
        if @admin
            if @admin.password == params[:password]
                session[:admin] = @admin.name
                redirect_to shlok_ashlokr_path
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
        session.delete(:admin)
        redirect_to root_url
    end
end
