class CourseController < ApplicationController
    def ucourse
        render "ucourse"
    end

    def course
        @visit = session[:visit]
    end
    def mcourser
        if session[:member]
            render "mcourser"
        else
            redirect_to root_url
        end
    end
end
