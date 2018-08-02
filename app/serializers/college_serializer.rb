class CollegeSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :address_2, :state, :email, :phone, :description
  has_many :course
end
