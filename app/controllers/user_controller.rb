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
        course = Course.find_by(name: params[:name])
        if session[:user]
            @user = User.find_by(email: session[:email])
            render "uform"
        else
            flash[:alert] = "Please login as user first!"
            redirect_to user_login_path
        end
    end

    def uformp
        if session[:user]
            table = params[:name]
            email = session[:email]
            pcount = ActiveRecord::Base.connection.execute("select count(*) from " + table + ";")[0]["count"]
            screg = ""
            if pcount == 0
                screg = "SC00001"
            else
                last = ActiveRecord::Base.connection.execute("select regid from " + table + " order by regid desc limit 1;")[0]["regid"]
                screg = last[0..2] + (last[2..-1].to_i + 1).to_s.rjust(4, "0")
            end
            user = User.find_by(email: email)
            pid = user.id
            query = "insert into " + table + "(pid, regid, email) values(" + pid.to_s + ", '" + screg + "', '" + email + "');"
            ActiveRecord::Base.connection.execute(query)
            user.update(:name => params[:name], :email => params[:email], :profile => true, :country => params[:country],
                        :state => params[:state], :pin => params[:pin], :gender => params[:gender],
                        :age => params[:age], :mobile => params[:mobile], :sanslevel => params[:sanslevel], :acadqual => params[:acadqual])
            flash[:alert] = "Registered succesfully!"
            redirect_to course_path
        else
            flash[:alert] = "Please login as a user first!"
            redirect_to course_path
        end
    end
end
