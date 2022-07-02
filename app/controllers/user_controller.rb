class UserController < ApplicationController
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

    def muserr
        if session[:member]
            @users = User.where(nil)
            @keys = ["name", "email", "country", "state", "pin", "gender", "age", "mobile", "sanslevel", "acadqual", "regid", "courses"]
            @cols = ["Name", "Email", "Country", "State", "PIN", "Gender", "Age", "Mobile no.", "Sanskrit Proficiency Level",
                        "Academic Qualification", "Regid", "Courses registered in"]
            for i in @keys
                @users = @users.filter_by_(i, params[i]) if params[i].present?
            end
            @count = @users.count
            @users = @users.order(:regid)
            render "users"
        else
            redirect_to root_url
        end
    end

    def muserdp
        if session[:member]
            user = User.find(params[:id])
            if user.courses?
                courses = user.courses.split(", ")
                for i in courses
                    ActiveRecord::Base.connection.execute("delete from " + i + " where pid=" + user.id.to_s + ";")
                end
            end
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
        pp = params[:user]
        @user.update(:name => pp[:name], :profile => true, :country => pp[:country],
                    :state => pp[:state], :pin => pp[:pin], :gender => pp[:gender], :age => pp[:age],
                    :mobile => pp[:mobile], :sanslevel => pp[:sanslevel], :acadqual => pp[:acadqual])
        # session[:email] = pp[:email] if session[:email] != pp[:email]
        flash[:alert] = "Profile updated!"
        redirect_to profile_path
    end
end
