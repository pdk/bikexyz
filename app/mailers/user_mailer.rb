class UserMailer < ActionMailer::Base
  default from: "robot@bikexyz.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.auth.subject
  #
  def auth(email)
    @auth = AuthKey.create!(:email => email)

    p "http://www.bikexyz.com#{ verify_path @auth.id, @auth.key }"
    
    mail to: email, :subject => "identity verification"
  end
end
