class List < ApplicationRecord
	has_many :users, through: :list_users
	has_many :list_users
	has_many :randos
	has_many :books
	has_many :movies
	has_many :songs
	has_many :places
end
