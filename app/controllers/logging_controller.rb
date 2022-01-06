class LoggingController < ApplicationController
    def login
    end
    def loginp
        @member = Member.find_by(email: params[:email])
        if @member
            if @member.password == params[:password]
                session[:member] = @member.name
                redirect_to shlok_mshlokr_path
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
        session.delete(:member)
        redirect_to root_url
    end
end
