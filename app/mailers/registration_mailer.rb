require 'sendgrid-ruby'


class RegistrationMailer < ApplicationMailer
    # def registration_email(user)
    #     @user = user
    #     from = Email.new(email: 'jeff.wainaina@student.moringaschool.com', name: "Jeff Wainaina")
    #     to = Email.new(email: @user.email_address)
    #     subject = 'Invitation to join'
    #     content = Content.new(type: 'text/plain', value: @user.password)
    #     mail = Mail.new(from, subject, to, content)
    #     sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
    #     response = sg.client.mail._('send').post(request_body: mail.to_json)
    #     byebug
    #     puts response.status_code
    #     puts response.body
    #     puts response.headers
    # end

    def registration_email(user)
        @user = user
        from = SendGrid::Email.new(email: 'jeff.wainaina@student.moringaschool.com')
        to = SendGrid::Email.new(email: @user.email_address)
        subject = 'Invitation email'
        content = SendGrid::Content.new(type: 'text/plain', value: @user.password)
        mail = SendGrid::Mail.new(from, subject, to, content)
        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

        smtp_settings = {
            address: 'smtp.sendgrid.net',
            port: 587,
            user_name: 'apikey',
            password: ENV['SENDGRID_API_KEY'],
            authentication: :plain,
            enable_starttls_auto: true
            }
        response = sg.client.mail._('send').post(request_body: mail.to_json, smtpapi: smtp_settings)
        byebug
        puts response.status_code
        puts response.body
        puts response.headers

    end
end
