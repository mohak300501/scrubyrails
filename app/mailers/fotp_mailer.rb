class FotpMailer < ApplicationMailer
    def fotp_mail
        @fotp = params[:fotp]
        email = params[:email]
        mail(to: email, subject: "OTP for resetting your password on Sanskrit Club IITR website.")
    end
end
