class ApplicationController < ActionController::Base
    before_action :visit_count
    def visit_count
        session[:visit] ||= 0
        session[:visit] += 1
        visits = Visit.first
        vc = visits.vid
        if session[:visit] == 1
            vc += 1
            visits.update(:vid => vc)
        session[:vc] = vc
        end
    end
end
