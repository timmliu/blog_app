class User < ActiveRecord::Base
	VALID_USERNAME_REGEX = /\A[a-z]_?(?:[a-z0-9]_?)*\z/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :username, presence: true, length: { maximum: 25 }, format: { with: VALID_USERNAME_REGEX }, uniqueness: true
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
