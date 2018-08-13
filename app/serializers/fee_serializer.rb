class FeeSerializer < ActiveModel::Serializer
  attributes :id, :payment_method, :amount, :user_id
end
