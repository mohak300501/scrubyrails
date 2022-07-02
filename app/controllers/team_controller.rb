class TeamController < ApplicationController
    def uteam
        @teams = Member.all
        render "uteam"
    end

    def mteamr
        if session[:member]
            @teams = Member.all
            render "mteamr"
        else
            redirect_to root_url
        end
    end

    # def mteamc
    #     if session[:team]
    #         render "mteamc"
    #     else
    #         redirect_to root_url
    #     end
    # end

    # def mteamcp
    #     team = Team.new(:title => params[:title], :team => params[:team],
    #                         :updated_by => session[:email], :audio => params[:audio])
    #     team.save
    #     flash[:notice] = "नूतनः श्लोकः योजितः जातः!"
    #     redirect_to all_teams_path
    # end

    def mteamu
        if session[:member]
            @team = Member.find(params[:id])
            render "mteamu"
        else
            redirect_to root_url
        end
    end

    def mteamup
        team = Member.find(params[:id])
        pp = params[:member]
        team.update(:name => pp[:name], :email => pp[:email], :password => pp[:password])
        flash[:notice] = "member details परिवर्तितः जातः!"
        redirect_to all_teams_path
    end

    def mteamdp
        if session[:member]
            team = Member.find(params[:id])
            team.destroy
            redirect_to all_teams_path
        else
            redirect_to root_url
        end
    end

    def profile
        if session[:member]
            @team = Member.find_by(email: session[:email])
            render "profile"
        else
            redirect_to root_url
        end
    end

end
