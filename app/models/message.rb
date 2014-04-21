class Message < ActiveRecord::Base
  before_create :send_sms
  belongs_to :user

private

  def send_sms
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.twilio.com/2010-04-01/Accounts/AC3236c02ff83ccf935d32ad56d215a86e/Messages.json',
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => {:Body => body,
                      :From => from,
                      :To => to }
      ).execute
    rescue RestClient::BadRequest => error

      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
