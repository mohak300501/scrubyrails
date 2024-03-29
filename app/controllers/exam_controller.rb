class ExamController < ApplicationController
    #      Exam_{no}_{course}_p      #                   Exam_{no}_{course}_Q                    #
    #  +--------------------------+  #  +-----------------------------------------------------+  #
    #  | id | pid | Q1 | Q2 | ... |  #  | id | question | opt1 | opt2 | opt3 | opt4 | correct |  #
    #  +--------------------------+  #  +-----------------------------------------------------+  #
    #                                #                                                           #

    def uexam1
        if session[:user]
            email = session[:email]
            exam_name = params[:ename] + "_" + params[:cname]
            qtable = exam_name + "_q"
            ptable = exam_name + "_p"
            user = User.find_by(email: email)
            @questions = ActiveRecord::Base.connection.exec_query("select * from " + qtable + ";")
            @participant = ActiveRecord::Base.connection.exec_query("select * from " + ptable + " where pid=" + user.id.to_s + ";")[0]

            # Fetch marks from parent course table
            @marks = ActiveRecord::Base.connection.exec_query("select " + exam_name + " from " + params[:cname] + " where email='" + email + "';")[0].first()[1]
            if @marks.nil?
                if exam_name == "Exam_8_geeta"
                    render "uexamclosed"
                else
                    render "uexam1"
                end
            else
                render "uexam1done"
            end
        else
            redirect_to root_url
        end
    end

    def mexamc
        if session[:member]
            render "mexamc"
        else
            redirect_to root_url
        end
    end

    def mexamcp
        if session[:member]
            exam_name = "Exam_" + params[:eno] + "_" + params[:cname]

            begin
                # Add new exam to its parent course table as a new column
                ActiveRecord::Base.connection.execute("alter table " + params[:cname] + " add column " + exam_name + " int;")

                # Add new exam to Exam table
                type = params[:etype] == "true" ? true : false
                exam = Exam.new(:name => exam_name, :etype => type, :info => params[:info])
                exam.save
                change = Change.new(:time => Time.now, :email => session[:email], :table => "exams", :cord => "create")
                change.save
            rescue
                flash[:alert] = exam_name + " already exists."
                redirect_to exam_new_path(params[:cname]) and return
            end

            # Create two new tables for participants and questions: Exam_{no}_{course}_p, Exam_{no}_{course}_q
            ActiveRecord::Base.connection.execute("create table if not exists " + exam_name + "_p(id serial, pid int);")
            ActiveRecord::Base.connection.execute("create table if not exists " + exam_name + "_q(
                id serial, question varchar(250), opt1 varchar(100), opt2 varchar(100), opt3 varchar(100), opt4 varchar(100), correct varchar(100));")

            redirect_to all_courses_path
        else
            redirect_to root_url
        end
    end

    def mexamu
        if session[:member]
            @exam = Exam.find_by(name: params[:ename] + "_" + params[:cname])
            render "mexamu"
        else
            redirect_to root_url
        end
    end

    def mexamup
        if session[:member]
            exam = Exam.find_by(name: params[:ename] + "_" + params[:cname])
            exam_name = "Exam_" + params[:eno] + "_" + params[:cname]
            if exam.name != exam_name
                ActiveRecord::Base.connection.execute("alter table " + exam.name + "_p rename to " + exam_name + "_p;")
                ActiveRecord::Base.connection.execute("alter table " + exam.name + "_q rename to " + exam_name + "_q;")
                ActiveRecord::Base.connection.execute("alter table " + params[:cname] + " rename column " + exam.name + " to " + exam_name + ";")
            end
            exam.update(:name => exam_name, :info => params[:info])
            change = Change.new(:time => Time.now, :email => session[:email], :table => "exams", :cord => "update")
            change.save
            redirect_to ques_read_path(params[:cname], "Exam_" + params[:eno]) and return
        else
            redirect_to root_url
        end
    end

    def mexamdp
        if session[:member]
            exam_name = params[:ename] + "_" + params[:cname]
            exam = Exam.find_by(name: exam_name)
            exam.destroy
            change = Change.new(:time => Time.now, :email => session[:email], :table => "exams", :cord => "delete")
            change.save

            ActiveRecord::Base.connection.execute("drop table " + exam_name + "_p;")
            ActiveRecord::Base.connection.execute("drop table " + exam_name + "_q;")
            ActiveRecord::Base.connection.execute("alter table " + params[:cname] + " drop column " + exam_name + ";")
            redirect_to all_courses_path
        else
            redirect_to root_url
        end
    end

    def mquescr
        if session[:member]
            exam_name = params[:ename] + "_" + params[:cname]
            @exam = Exam.find_by(name: exam_name)
            ptable = exam_name + "_p"
            qtable = exam_name + "_q"
            @questions = ActiveRecord::Base.connection.exec_query("select * from " + qtable + ";")

            if request.post?

                # Add new question to Exam_{no}_{course}_q
                query = "insert into " + qtable + "(question, opt1, opt2, opt3, opt4, correct)" + " values('" + params[:question] + "', '" + params[:opt1] + "',
                        '" + params[:opt2] + "', '" + params[:opt3] + "', '" + params[:opt4] + "', '" + params[:correct] + "');"
                ActiveRecord::Base.connection.execute(query)

                # Get last id from Exam_{no}_{course}_q
                id = ActiveRecord::Base.connection.exec_query("select max(id) from " + qtable + ";")[0]["max"]

                # Add new question to Exam_{no}_{course}_p as a new column
                ActiveRecord::Base.connection.execute("alter table " + ptable + " add column Q" + id.to_s + " varchar(100);")

                redirect_to ques_read_path(params[:cname], params[:ename]) and return
            end

            render "mquescr"
        else
            redirect_to root_url
        end
    end

    def mquesu
        if session[:member]
            qtable = params[:ename] + "_" + params[:cname] + "_q"
            @question = ActiveRecord::Base.connection.exec_query("select * from " + qtable + " where id=" + params[:qno].to_s + ";")[0]
            render "mquesu"
        else
            redirect_to root_url
        end
    end

    def mquesup
        if session[:member]
            qtable = params[:ename] + "_" + params[:cname] + "_q"
            query = "update " + qtable + " set question='" + params[:question] + "', opt1='" + params[:opt1] + "', opt2='" + params[:opt2] + "',
                    opt3='" + params[:opt3] + "', opt4='" + params[:opt4] + "', correct='" + params[:correct] + "' where id=" + params[:qno] + ";"
            ActiveRecord::Base.connection.execute(query)
            redirect_to ques_read_path(params[:cname], params[:ename])
        else
            redirect_to root_url
        end
    end

    def mquesdp
        if session[:member]
            exam_name = params[:ename] + "_" + params[:cname]
            ptable = exam_name + "_p"
            qtable = exam_name + "_q"
            ActiveRecord::Base.connection.execute("delete from " + qtable + " where id=" + params[:qno].to_s + ";")
            ActiveRecord::Base.connection.execute("alter table " + ptable + " drop column Q" + params[:qno].to_s + ";")
            redirect_to ques_read_path(params[:cname], params[:ename])
        else
            redirect_to root_url
        end
    end

    def uexamp
        if session[:user]
            user = User.find_by(email: session[:email])
            exam_name = params[:ename] + "_" + params[:cname]
            ptable = exam_name + "_p"
            qtable = exam_name + "_q"
            questions = ActiveRecord::Base.connection.exec_query("select * from " + qtable + ";")
            qs = []     # questions
            as = []     # answers
            marks = 0
            for i in questions do
                qs << "Q#{i["id"]}"
                ans = i[params[:"ans_#{i["id"]}"]]
                as << ans
                if ans == i["correct"]
                    marks += 1
                end
            end

            # Add new entry to Exam_{no}_{course}_p with current participant's marks
            ActiveRecord::Base.connection.execute("insert into " + ptable + "(pid, " + qs.join(", ") + ") values (" + user.id.to_s + ",
                '" + as.join("', '") + "');")

            # Add total marks to parent course table
            ActiveRecord::Base.connection.execute("update " + params[:cname] + " set " + exam_name + "=" + marks.to_s + " where pid=" + user.id.to_s + ";")
            
            flash[:notice] = "Quiz completed successfully!"
            redirect_to course_uview_path(params[:cname])
        else
            redirect_to root_url
        end
    end

    def re_marks
        # Renormalize participant marks after modifying correct answers of questions, or adding/deleting questions
        if session[:member]
            exam_name = params[:ename] + "_" + params[:cname]
            exam = Exam.find_by(name: exam_name)
            ptable = exam_name + "_p"
            qtable = exam_name + "_q"
            questions = ActiveRecord::Base.connection.exec_query("select * from " + qtable + ";")
            participants = ActiveRecord::Base.connection.exec_query("select * from " + ptable + ";")

            for i in participants do
                marks = 0
                for j in questions do
                    if i["q" + j["id"].to_s] == j["correct"]
                        marks += 1
                    end
                end
                ActiveRecord::Base.connection.execute("update " + params[:cname] + " set " + exam_name + "=" + marks.to_s + " where pid=" + i["pid"].to_s + ";")
            end

            change = Change.new(:time => Time.now, :email => session[:email], :table => "re_marks", :cord => "update")
            change.save

            redirect_to ques_read_path(params[:cname], params[:ename]) and return
        else
            redirect_to root_url
        end
    end

    def mp_marks
        if session[:member]
            cname = params[:cname]
            @exams = Exam.select("name").where("name like '%#{cname}%'")
            @participants = ActiveRecord::Base.connection.exec_query("select * from " + cname + ";")
            render "mp_marks"
        else
            redirect_to root_url
        end
    end
end
