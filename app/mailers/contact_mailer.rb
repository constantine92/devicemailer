class ContactMailer < ActionMailer::Base
    default to: "info@gabriel.com"
    def contact_email(name, email, message)
        @name = name
        @email = email
        @message = message
        mail(from: email, subject: 'GabrielSu.com Contact Form Message')
    end
end