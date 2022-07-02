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
        if session[:team]
            @team = Team.find(params[:id])
            render "mteamu"
        else
            redirect_to root_url
        end
    end

    def mteamup
        team = Team.find(params[:id])
        pp = params[:team]
        team.update(:title => pp[:title], :team => pp[:team], :translation => pp[:translation],
                        :updated_by => session[:email])
        if pp[:audio].present?
            team.audio.purge
            team.audio.attach(pp[:audio])
        end
        flash[:notice] = "श्लोकः परिवर्तितः जातः!"
        redirect_to all_teams_path
    end

    def mteamdp
        if session[:team]
            team = Team.find(params[:id])
            team.destroy
            redirect_to all_teams_path
        else
            redirect_to root_url
        end
    end
end
