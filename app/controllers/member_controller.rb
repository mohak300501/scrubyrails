class MemberController < ApplicationController
    def uteam
        @members = Member.all
        render "uteam"
    end

    def mmemberr
        main_mem = Rails.application.credentials.mail[:MAIL_USERNAME]
        if session[:email] == main_mem
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
        flash[:notice] = "member details परिवर्तितः जातः!"
        redirect_to all_members_path
    end

    def mmemberdp
        main_mem = Rails.application.credentials.mail[:MAIL_USERNAME]
        if session[:email] == main_mem
            member = Member.find(params[:id])
            member.destroy
            redirect_to all_members_path
        else
            redirect_to root_url
        end
    end

    def memarea
        if session[:member]
            main_mem = Rails.application.credentials.mail[:MAIL_USERNAME]
            if session[:email] == main_mem
                @main_mem = true
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

end
