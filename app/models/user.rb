class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :secret_code
  validate :no_secret_code, :on => :create, if: -> { self.code.present? }
  after_create :link_secret_code, if: -> { self.code.present? }

  attr_accessor :code

  def no_secret_code
  	if self.code.present?
      secret_code = SecretCode.find_by(code: self.code)
      if secret_code.nil?
        errors.add(:code, "is invalid")
        return false
      else
        return true
      end
    else
      errors.add(:code, "is blank")
      return false
    end
    return true
  end

  def link_secret_code
    secret_code = SecretCode.find_by(code: self.code)
    secret_code.update!(user_id: self.id)
  end

end
