class CourseController < ApplicationController
    def ucourse
        @courses = Course.all
        render "ucourse"
    end

    def mcourser
        if session[:member]
            @courses = Course.all
            render "mcourser"
        else
            redirect_to root_url
        end
    end

    def mcoursec
        if session[:member]
            render "mcoursec"
        else
            redirect_to root_url
        end
    end

    def mcoursecp
        course = Course.new(:name => params[:name], :description => params[:description], :image => params[:image])
        course.save

        ActiveRecord::Base.connection.execute("create table " + params[:name] +
            "(id serial primary key, pid int, regid varchar(10), email varchar(50),
            constraint fk_user_id foreign key(pid) references users(id));")

        flash[:notice] = "New course created!"
        redirect_to all_courses_path
    end

    def mcoursedp
        course = Course.find(params[:id])
        ActiveRecord::Base.connection.execute("drop table if exists " + course.name + ";")
        course.destroy
        redirect_to all_courses_path
    end

    def ucourse1
        table = params[:name]
        @course = Course.find_by(name: table)
        @user_exists = 0
        if session[:user]
            @user = User.find_by(email: session[:email])
            @user_exists = ActiveRecord::Base.connection.execute("select count(*) from " + table + " where email='" + session[:email] + "';")[0]["count"]
        else
        end
        render "ucourse1"
    end
end
