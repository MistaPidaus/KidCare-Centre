class College < ApplicationRecord
	has_many :course
	has_and_belongs_to_many :users
end
