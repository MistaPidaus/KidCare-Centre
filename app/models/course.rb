class Course < ApplicationRecord
	belongs_to :college
	has_many :unit

	has_and_belongs_to_many :users
end
