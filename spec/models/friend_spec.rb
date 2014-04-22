require 'spec_helper'

describe Friend do
  it { should have_many :messages }
  it { should belong_to :user }

  context 'validates presence_of_name' do
    it 'validates that a name is present' do
      friend = build(:friend, name: "")
      friend.save
      friend.errors.messages[:name][0].should eq "can't be blank"
    end
  end

  context 'validates presence_of_phone' do
    it 'validates that a phone is present' do
      friend = build(:friend, phone: "")
      friend.save
      friend.errors.messages[:phone][0].should eq "can't be blank"
    end
  end

  context 'ensures_length_of phone' do
    it 'validates that a phone is 10 digits long ' do
      friend = build(:friend, phone: "345634")
      friend.save
      friend.errors.messages[:phone][0].should eq "is the wrong length (should be 10 characters)"
    end
  end

  context 'validate_number' do
    it 'validates the phone number to be "1111111111" format' do
      friend = build(:friend, phone: "1-234567890")
      friend.save
      friend.phone.should eq "1234567890"
    end
  end
end
