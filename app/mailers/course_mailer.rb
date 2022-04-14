class CourseMailer < ApplicationMailer
    def ureg_mail
        @course = params[:course]
        user = params[:user_email]
        mail(to: user, subject: "Successfully registered for course " + course + ".")
    end
end
