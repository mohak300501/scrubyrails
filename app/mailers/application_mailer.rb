class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.mail[:MAIL_USERNAME]
  layout 'mailer'
end
