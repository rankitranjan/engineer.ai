class SecretCode < ApplicationRecord
	
	NO_OF_SECRET_CODE = [1, 10, 20, 50, 100]

	belongs_to :user, optional: true
	
  	validates :code, presence: true
  	validates :code, uniqueness: true

	def self.create_secret_codes(no_of_sc)
		no_of_sc.to_i.times do |i|
			sc = new()
			sc.get_uniq_code
			sc.save!
		end
	end

  	def get_uniq_code
		self.code = loop do
	      random_token = SecureRandom.urlsafe_base64(nil, false) # if nil default is 16, The length of the result string is about 4/3 of n.
	      break random_token unless SecretCode.exists?(code: random_token)
	    end
	end

end
