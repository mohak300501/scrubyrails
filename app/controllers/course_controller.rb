class CourseController < ApplicationController
    def ucourse
        @courses = Course.all.order(id: :desc)
        render "ucourse"
    end

    def mcourser
        if session[:member]
            @courses = Course.all.order(id: :desc)
            @exams = Exam.all
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
        course = Course.new(:name => params[:name], :cname => params[:cname], :regon =>params[:regon], :more => params[:more], :yt => params[:yt],
                            :description => params[:description], :image => params[:image])
        course.save
        change = Change.new(:time => Time.now, :email => session[:email], :table => "courses", :cord => "create")
        change.save

        ActiveRecord::Base.connection.execute("create table " + params[:cname] +
            "(id serial primary key, pid int, regid varchar(10), email varchar(50),
            constraint fk_user_id foreign key(pid) references users(id));")

        flash[:notice] = "New course created!"
        redirect_to all_courses_path
    end

    def mcourseu
        if session[:member]
            @course = Course.find(params[:id])
            render "mcourseu"
        else
            redirect_to root_url
        end
    end

    def mcourseup
        course = Course.find(params[:id])
        pp = params[:course]
        if !(course.cname == pp[:cname])
            ActiveRecord::Base.connection.execute("alter table " + course.cname + " rename to " + pp[:cname] + ";")
        end
        course.update(:name => pp[:name], :cname => pp[:cname], :regon =>pp[:regon], :description => pp[:description], :more => pp[:more], :yt => pp[:yt])
        if pp[:image].present?
            course.image.purge
            course.image.attach(pp[:image])
        end
        change = Change.new(:time => Time.now, :email => session[:email], :table => "courses", :cord => "update")
        change.save
        flash[:notice] = "CourseH परिवर्तितः जातः!"
        redirect_to all_courses_path
    end

    def mcoursedp
        if session[:member]
            course = Course.find(params[:id])
            course_parts = ActiveRecord::Base.connection.exec_query("select pid from " + course.cname + ";")
            for i in course_parts.rows
                user = User.find(i[0])
                user_courses = user.courses.split(", ") - [course.cname]
                user.update(:courses => user_courses.join(", "))
            end
            ActiveRecord::Base.connection.execute("drop table if exists " + course.cname + ";")
            course.destroy
            change = Change.new(:time => Time.now, :email => session[:email], :table => "courses", :cord => "delete")
            change.save
            redirect_to all_courses_path
        else
            redirect_to root_url
        end
    end

    def ucourse1
        email = session[:email]
        table = params[:cname]
        @course = Course.find_by(cname: table)
        @exams = Exam.all
        @user_regd = 0
        if session[:user]
            # @user = User.find_by(email: email)
            @user_regd = ActiveRecord::Base.connection.execute("select count(*) from " + table + " where email='" + email + "';")[0]["count"] # one way
        end
        render "ucourse1"
    end

    def ureg
        if session[:user]
            email = session[:email]
            user = User.find_by(email: email)
            if user.profile
                table = params[:cname]
                # if user.courses.include? table # another way of saying the same thing
                user_regd = ActiveRecord::Base.connection.execute("select count(*) from " + table + " where email='" + email + "';")[0]["count"]
                if user_regd > 0
                    redirect_to course_uview_path(table)
                else
                    user_regid = ""
                    if user.regid.nil?
                        var = Bgvar.first
                        user_regid = var.regid[0..2] + (var.regid[2..-1].to_i + 1).to_s.rjust(4, "0")
                        var.update(:regid => user_regid)
                        user.update(:regid => user_regid)
                    else
                        user_regid = user.regid
                    end
                    pid = user.id
                    query = "insert into " + table + "(pid, regid, email) values(" + pid.to_s + ", '" + user_regid + "', '" + email + "');"
                    ActiveRecord::Base.connection.execute(query)
                    if user.courses.nil?
                        user.courses = table
                    else
                        user.courses += ", " + table
                    end
                    user.update(:courses => user.courses)
                    course = Course.find_by(cname: table).name
                    CourseMailer.with(course: course, user_email: email).ureg_mail.deliver_later
                    flash[:notice] = "You have successfully registered for the course!"
                    redirect_to course_uview_path(table)
                end
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
