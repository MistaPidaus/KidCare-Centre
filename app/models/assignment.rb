class Assignment < ApplicationRecord
	mount_uploaders :file, AssignmentUploader
	belongs_to :unit
end
