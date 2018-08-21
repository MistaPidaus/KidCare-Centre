class Assignment < ApplicationRecord
	mount_uploaders :assignment_file, AssignmentUploader
	serialize :assignment_file, JSON
	belongs_to :course
	has_many :assignment_marks
end
