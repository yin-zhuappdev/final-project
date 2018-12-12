# == Schema Information
#
# Table name: insurance_plans
#
#  id                          :integer          not null, primary key
#  coinsurance_paid_by_patient :float
#  deductible                  :float
#  monthly_premium             :float
#  plan_name                   :string
#  age_group                   :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  smoker_status               :boolean
#

class InsurancePlan < ApplicationRecord
  has_many :user_plans, :class_name => "InterestedPlan", :dependent => :destroy
  has_many :applicants, :through => :user_plans, :source => :user
end
