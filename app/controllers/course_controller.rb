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
            '(id serial primary key, pid int, regid varchar(10), email varchar(50),
            constraint fk_user_id foreign key(pid) references users(id));')

        flash[:notice] = "New course created!"
        redirect_to all_courses_path
    end

    def mcoursedp
        course = Course.find(params[:id])
        ActiveRecord::Base.connection.execute('drop table if exists ' + course.name + ';')
        course.destroy
        redirect_to all_courses_path
    end

    def ucourse_reg
        if session[:user]
            table = params[:id]
            pcount = ActiveRecord::Base.connection.execute('select count(*) from ' + table + ';')
            screg = ""
            if pcount == 0
                screg = "SC00001"
            else
                last = ActiveRecord::Base.connection.execute('select last(regid) from ' + table + ';')
                screg = last[0..2] + (last[2..-1].to_i + 1).to_s
            end
            pid = User.find(session[:email]).id
            ActiveRecord::Base.connection.execute('insert into ' + params[:id] + '(pid, regid, email) values('
                + pid + ', ' + screg + ', ' + session[:email] + ');')
        else
            flash[:notice] = "Please login as a user first!"
            redirect_to courses_path
        end
    end
end
