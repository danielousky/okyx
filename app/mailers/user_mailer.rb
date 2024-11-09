class UserMailer < ApplicationMailer

    def welcome(user)
        @user = user
        @url = 'http://okyx.global/login'
        mail(to: @user.email, subject: 'Bienvenido a Okyx')
    end

end
