class User < ActiveRecord::Base
	attr_accessor :password
	before_save :encrypt_password
	has_many :posts

	validates :name , presence: { message: ": Veuillez Saisir votre Nom, svp..." }
	validates :email , presence: { message: ": Veuillez Saisir votre email, svp..." }
	validates :password , presence: { message: ": Veuillez Saisir votre pwd, svp..." }
	validates :password , confirmation: { message: ": Veuillez Saisir à Nouveau votre pwd, svp..." }

	#has_attached_file :image , :default_url => ':style/index.png'
	#validates_attachment_content_type :image , :content_type => /\Aimage\/.*\Z/


	def self.authenticate(email, password) #pwd et mail donnés
		user = find_by_email(email) # verif si prensant en base
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user                 #verif si pwd donné correspond à celui en base
		else
			nil
		end
	end
	 

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def self.search(query)
		where("name like  ? OR email like ?","%#{query}%","%#{query}%")
	end

end
