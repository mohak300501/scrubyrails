class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :visit_count
    def visit_count
        session[:visit] ||= 0
        session[:visit] += 1
        visits = Visit.first
        vc = visits.id
        if session[:visit] == 1
            vc += 1
            visits.update(:id => vc)
        end
        session[:vc] = vc
    end
end
