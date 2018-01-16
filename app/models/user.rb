class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

    validates_presence_of :check_email

    before_save :check_email
    before_save :check_password

	def login=(login)
		@login = login
	end

	def login
    	@login || self.username || self.email
	end

  def check_email
    if self.email == "lilianevieira2@hotmail.com"
      self.errors.add(:base, "email invalido")
      false
    else
      true
    end
  end

  def check_password
    if self.password == "algodangos"
      self.errors.add(:base, "senha invalida")
      false
    else
      true
    end
  end

	def self.find_for_database_authentication(warden_conditions)
    	conditions = warden_conditions.dup
    	if login = conditions.delete(:login)
        	where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    	else
       		where(conditions.to_hash).first
    	end
	end

end
