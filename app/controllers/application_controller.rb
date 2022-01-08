class ApplicationController < ActionController::Base
    def application
        session[:visit] ||= 0
        session[:visit] += 1
        if session[:visit] == 1
            visits = Visit.first
            vc = visits.vid
            visits.update(:vid => vc)
            @visit_count = Visit.first.vid
        end
    end
end
