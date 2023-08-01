class ApplicationController < ActionController::Base
    before_action :visit_count
    def visit_count
        session[:visit] ||= 0
        session[:visit] += 1
        var = Bgvar.first
        vc = var.visits
        if session[:visit] == 1
            vc += 1
            var.update(:visits => vc)
        end
        session[:vc] = vc
    end
end
