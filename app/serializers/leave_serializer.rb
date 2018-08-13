class LeaveSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :duration, :reason, :user_id
end
