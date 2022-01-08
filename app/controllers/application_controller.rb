class ApplicationController < ActionController::Base
    def application
        session[:visit] ||= 0
        session[:visit] += 1
        if session[:visit] == 1
            visits = Visit.first
            visits.update(:vid += 1)
            @visit_count = Visit.first.vid
        end
    end
end
