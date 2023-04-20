# require 'sendgrid-ruby'
# include SendGrid

# from = Email.new(email: 'jeff.wainaina@student.moringaschool.com')
# to = Email.new(email: 'jeffmuthunga@gmail.com')
# subject = 'Sending with SendGrid is Fun'
# content = Content.new(type: 'text/plain', value: 'God is great')
# mail = Mail.new(from, subject, to, content)

# sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
# response = sg.client.mail._('send').post(request_body: mail.to_json)
# puts response.status_code
# puts response.body
# puts response.headers

require 'sendgrid-ruby'

from = SendGrid::Email.new(email: 'jeff.wainaina@student.moringaschool.com')
to = SendGrid::Email.new(email: 'jeffmuthunga@gmail.com')
subject = 'Sending with SendGrid is Fun'
content = SendGrid::Content.new(type: 'text/plain', value: 'Hey cunt')
mail = SendGrid::Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

# Configure SMTP settings
smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY'],
  authentication: :plain,
  enable_starttls_auto: true
}

# Send email via SMTP
sg.client.mail._('send').post(request_body: mail.to_json, smtpapi: smtp_settings)

puts 'Email sent'







