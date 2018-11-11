class User < ApplicationRecord
  has_secure_password
  self.primary_key = 'id'

  validates :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  									# format: /\A\S+@\S+\z/,
                    format: { with: VALID_EMAIL_REGEX },
  									uniqueness: { case_sensitive: false }

  def self.authenticate(email, password)
		user = User.find_by(email: email)
		user && user.authenticate(password)
  end

end

 # https://rubyplus.com/articles/4171-Authentication-from-Scratch-in-Rails-5