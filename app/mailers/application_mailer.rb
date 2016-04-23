class ApplicationMailer < ActionMailer::Base
  default from: "noreply@" + APP_NAME + ".com"
  layout 'mailer'
end
