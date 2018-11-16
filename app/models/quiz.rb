class Quiz < ApplicationRecord
	belongs_to :course
	has_many :questions
	accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
