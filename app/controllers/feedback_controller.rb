class FeedbackController < ApplicationController
    def ufeedback
        @email = session[:email]
        render "ufeedback"
    end

    def ufeedbackp
        # if session[:user]
            feedback = Feedback.new(:email => params[:email], :typef => params[:typef], :feedback => params[:feedback], :time => Time.now)
            feedback.save
            flash[:notice] = params[:typef].capitalize + " submitted!"
            redirect_to root_url
        # else
        #     flash[:notice] = "Please log in as a user first!"
        #     redirect_to feedback_path
        # end
    end

    def mfeedbackr
        if session[:member]
            @feedbacks = Feedback.all
            render "mfeedbackr"
        else
            redirect_to root_url
        end
    end
end
