class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :secret_code  
  validates :secret_code, presence: true

  accepts_nested_attributes_for :secret_code, :reject_if => :no_secret_code?

  def no_secret_code?(attrs)
  	return attrs['code'].present? ? false : true
  end

end
