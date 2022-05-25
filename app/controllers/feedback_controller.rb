class FeedbackController < ApplicationController
    def ufeedbackp
        feedback = Feedback.new(:email => params[:email], :type_of_feedback => params[:type_of_feedback], 
        :feedback => params[:feedback])
        feedback.save
        redirect_to feedback_path
    end
    def ufeedback
        @feedbacks = Feedback.all
        render "ufeedback"
    end
end
