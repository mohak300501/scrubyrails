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

        ActiveRecord::Base.connection.execute('create table ' + params[:name] +
            '(id serial primary key, pid int foreign key references users(id), email varchar(50) foreign key references users(email));')

        flash[:notice] = "course will be displayed"
        redirect_to all_courses_path
    end

    def mcoursedp
        course = Course.find(params[:id])
        course.destroy
        redirect_to all_courses_path
    end
end
