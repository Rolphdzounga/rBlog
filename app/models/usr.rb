class Usr < ActiveRecord::Base
	has_many :posts

	before_save {self.email = email.downcase}

	validates_length_of :username,
		  :within => 3..25,
		  :too_short => 'Votre nom doit avoir au moins 3 caratères',
		  :too_long => 'Votre nom doit avoir au plus 25 caratères'

	
   validates :username, presence: true, uniqueness: {case_sensitive: false}
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, uniqueness: {case_sensitive: false},
   				format: {with: VALID_EMAIL_REGEX }

   	has_secure_password
end
