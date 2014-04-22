require 'spec_helper'

describe Message, vcr: true do
  it { should belong_to :user }
  it { should belong_to :friend }

  it 'doesnt save the message if twilio gives error' do
    message = build(:message, to: '013')
    message.save.should be_false
  end

  it 'adds an error if the number is invalid' do
    message = build(:message, to: '013')
    message.save
    message.errors[:base].should eq ["The 'To' number 013 is not a valid phone number."]
  end
end
