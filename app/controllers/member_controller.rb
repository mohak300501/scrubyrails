class MemberController < ApplicationController
    def uteam
        @members = Member.all
        render "uteam"
    end

    def mmemberr
        admin = Rails.application.credentials.mail[:MAIL_USERNAME]
        if session[:email] == admin
            @members = Member.all
            render "mmemberr"
        else
            redirect_to root_url
        end
    end

    # def mmemberc
    #     if session[:member]
    #         render "mmemberc"
    #     else
    #         redirect_to root_url
    #     end
    # end

    # def mmembercp
    #     member = member.new(:title => params[:title], :member => params[:member],
    #                         :updated_by => session[:email], :audio => params[:audio])
    #     member.save
    #     flash[:notice] = "नूतनः श्लोकः योजितः जातः!"
    #     redirect_to all_members_path
    # end

    def mmemberu
        if session[:member]
            @member = Member.find(params[:id])
            render "mmemberu"
        else
            redirect_to root_url
        end
    end

    def mmemberup
        member = Member.find(params[:id])
        pp = params[:member]
        member.update(:name => pp[:name], :email => pp[:email], :password => pp[:password])
        if pp[:image].present?
            if member.image.present?
                member.image.purge
            end
            member.image.attach(pp[:image])
        end
        change = Change.new(:time => Time.now, :email => pp[:email], :table => "members", :cord => "update")
        change.save
        session[:member] = pp[:name]
        session[:email] = pp[:email]
        flash[:notice] = "member details परिवर्तितः जातः!"
        redirect_to mprofile_path
    end

    def mmemberdp
        admin = Rails.application.credentials.mail[:MAIL_USERNAME]
        if session[:email] == admin
            member = Member.find(params[:id])
            member.destroy
            redirect_to all_members_path
        else
            redirect_to root_url
        end
    end

    def memarea
        if session[:member]
            admin = Rails.application.credentials.mail[:MAIL_USERNAME]
            if session[:email] == admin
                @admin = true
            end
            render "memarea"
        else
            redirect_to root_url
        end
    end

    def mprofile
        if session[:member]
            @member = Member.find_by(email: session[:email])
            render "mprofile"
        else
            redirect_to root_url
        end
    end

    def mchanger
        admin = Rails.application.credentials.mail[:MAIL_USERNAME]
        if session[:email] == admin
            @changes = Change.all
            render "mchanger"
        else
            redirect_to root_url
        end
    end

    # def msql
    #     admin = Rails.application.credentials.mail[:MAIL_USERNAME]
    #     if session[:email] == admin
    #         render "msql"
    #     else
    #         redirect_to root_url
    #     end
    # end

    def msql
        admin = Rails.application.credentials.mail[:MAIL_USERNAME]
        if session[:email] == admin
            if params[:query].present?
                @query = params[:query]
                sqlq = @query.split()
                if sqlq[0] == "show"
                    begin
                        @results = ActiveRecord::Base.connection.exec_query("select * from " + sqlq[1])
                    rescue => e
                        @error = e
                    end
                else
                    @error = "Please start queries with 'show'."
                end
            end
            render "msql"
        else
            redirect_to root_url
        end
    end
end
