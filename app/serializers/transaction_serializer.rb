class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :status, :amount, :fee_id
end
