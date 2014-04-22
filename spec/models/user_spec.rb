require 'spec_helper'

describe User do
  it { should have_many :messages }

  context 'validates presence_of_name' do
    it 'validates that a name is present' do
      user = build(:user, name: "")
      user.save
      user.errors.messages[:name][0].should eq "can't be blank"
    end
  end

  context 'validates presence_of_phone' do
    it 'validates that a phone is present' do
      user = build(:user, phone: "")
      user.save
      user.errors.messages[:phone][0].should eq "can't be blank"
    end
  end

  context 'ensures_length_of phone' do
    it 'validates that a phone is 10 digits long ' do
      user = build(:user, phone: "345634")
      user.save
      user.errors.messages[:phone][0].should eq "is the wrong length (should be 10 characters)"
    end
  end

  context 'validate_number' do
    it 'validates the phone number to be "1111111111" format' do
      user = build(:user, phone: "1-234567890")
      user.save
      user.phone.should eq "1234567890"
    end
  end
end
