class OtpMailer < ApplicationMailer
    def otp_mail
        @otp = params[:otp]
        email = params[:email]
        mail(to: email, subject: "OTP for signing up on Sanskrit Club IITR website.")
    end
end
