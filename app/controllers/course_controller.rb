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
        if session[:member]
            course = Course.find(params[:id])
            ActiveRecord::Base.connection.execute("drop table if exists " + course.name + ";")
            course.destroy
            redirect_to all_courses_path
        else
            redirect_to root_url
        end
    end

    def ucourse1
        email = session[:email]
        table = params[:cname]
        @course = Course.find_by(name: table)
        @user_regd = 0
        if session[:user]
            # @user = User.find_by(email: email)
            @user_regd = ActiveRecord::Base.connection.execute("select count(*) from " + table + " where email='" + email + "';")[0]["count"]
        end
        render "ucourse1"
    end

    def ureg
        if session[:user]
            email = session[:email]
            user = User.find_by(email: email)
            if user.profile
                table = params[:cname]
                # course = Course.find_by(name: table).name
                screg = ""
                if user.regid.nil?
                    pcount = ActiveRecord::Base.connection.execute("select count(*) from " + table + ";")[0]["count"]
                    if pcount == 0
                        screg = "SC00001"
                    else
                        last = ActiveRecord::Base.connection.execute("select regid from " + table + " order by regid desc limit 1;")[0]["regid"]
                        screg = last[0..2] + (last[2..-1].to_i + 1).to_s.rjust(4, "0")
                    end
                    user.update(:regid => screg)
                else
                    screg = user.regid
                end
                pid = user.id
                query = "insert into " + table + "(pid, regid, email) values(" + pid.to_s + ", '" + screg + "', '" + email + "');"
                ActiveRecord::Base.connection.execute(query)
                if user.courses.nil?
                    user.courses = table
                else
                    user.courses = user.courses + "," + table
                end
                user.update(:courses => user.courses)
            else
                flash[:notice] = "Please update your profile to register for a course."
                redirect_to profile_path
            end
        else
            flash[:notice] = "Please log in as user to register for a course."
            redirect_to user_login_path
        end
    end
end
