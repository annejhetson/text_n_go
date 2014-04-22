class Friend < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  validates :name, presence: true
  validates :phone, presence: true,
                    length: {is: 10}

  before_validation :validate_number

  def validate_number
    self.phone.gsub!(/[^0-9]/, "")
  end
end
