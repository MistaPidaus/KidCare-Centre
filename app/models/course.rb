class Course < ApplicationRecord
	belongs_to :college
	has_many :unit
end
