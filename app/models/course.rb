class Course < ApplicationRecord
	belongs_to :college
	has_many :unit
	has_many :assignment
	has_many :quizzes
	has_one :certificate, dependent: :destroy
	belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

	has_and_belongs_to_many :users
end
