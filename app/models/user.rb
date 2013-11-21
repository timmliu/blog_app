class User < ActiveRecord::Base
	before_save { self.username = username.downcase }
	before_save { self.email = email.downcase }
	VALID_USERNAME_REGEX = /\A[a-z]_?(?:[a-z0-9]_?)*\z/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :username, presence: true, length: { maximum: 25 }, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password
end
