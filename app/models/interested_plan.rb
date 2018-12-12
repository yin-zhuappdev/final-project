# == Schema Information
#
# Table name: interested_plans
#
#  id                :integer          not null, primary key
#  insurance_plan_id :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class InterestedPlan < ApplicationRecord
  validates :user_id, presence: true, uniqueness: {scope: [:user_id, :insurance_plan_id]} 
  validates :insurance_plan_id, presence: true
  belongs_to :user
  belongs_to :insurance_plan
end
