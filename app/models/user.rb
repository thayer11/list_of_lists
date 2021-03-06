class User < ApplicationRecord
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :bio, presence: true
	validates :password_digest, presence: true
	validates :img_url, presence: true
	has_many :list_users
	has_many :lists, through: :list_users
	has_many :followers, :class_name => "Followings", :foreign_key => "user_id"
	has_many :following, :class_name => "Followings", :foreign_key => "follower_id"
	has_secure_password

	def self.confirm(params)
		@user = User.find_by({username: params[:username]})
		@user.try(:authenticate, params[:password])
	end
end