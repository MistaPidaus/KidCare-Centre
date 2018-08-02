class TaskaSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :address, :state, :phone_number, :email
end
