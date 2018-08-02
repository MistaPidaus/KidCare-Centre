class Unit < ApplicationRecord
  mount_uploader :picture, UnitPictureUploader
  mount_uploaders :attachment, UnitAttachmentUploader
  serialize :attachment, JSON

  belongs_to :course
  has_many :assignment
end
