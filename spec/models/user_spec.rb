require 'spec_helper'

describe User do
  it { should have_many :messages }
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should ensure_length_of(:phone).is_equal_to(10) }

  context 'validate_number' do
    it 'validates the phone number to be "1111111111" format' do
      user = build(:user, phone: "1-234567890")
      user.validate_number
      user.save
      user.phone.should eq "1234567890"
    end
  end
end
