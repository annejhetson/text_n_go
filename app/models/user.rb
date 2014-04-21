class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :phone, presence: true,
                    length: {is: 10}
  has_many :messages

  def validate_number
    self.phone.gsub!(/[^0-9]/, "")
  end
end
