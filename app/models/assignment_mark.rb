class AssignmentMark < ApplicationRecord
	mount_uploaders :file, AssignmentMarkUploader
  	serialize :file, JSON 

	belongs_to :assignment
	belongs_to :user
end
