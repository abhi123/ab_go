class Sms < ActionMailer::Base
  default :from => "999abhijit888@gmail.com"

  def welcome_email()
    mail(:to => "9198909890364405@airtelmail.com", :subject => "trial sms ")
  end
end
