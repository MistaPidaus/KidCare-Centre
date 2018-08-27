class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :courses, join_table: 'courses_users', class_name: 'Course'
  has_and_belongs_to_many :certificates
  has_and_belongs_to_many :colleges
  has_many :created, class_name: 'Course', foreign_key: 'creator_id'
  has_many :assignment_mark
end
