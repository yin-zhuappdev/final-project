# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  user_name              :string
#  birthday               :date
#  state                  :string
#  tobacco_use            :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  estimated_cost         :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, presence: true, uniqueness: true
  has_many :user_plans, :class_name => "InterestedPlan", :dependent => :destroy
  has_many :interested_plans, :through => :user_plans, :source => :insurance_plan
end
