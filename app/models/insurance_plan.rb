# == Schema Information
#
# Table name: insurance_plans
#
#  id                          :integer          not null, primary key
#  coinsurance_paid_by_patient :float
#  deductible                  :float
#  monthly_premium             :float
#  plan_name                   :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class InsurancePlan < ApplicationRecord
  validates :coinsurance_paid_by_patient, presence: true 
  validates :deductible, presence: true
  validates :monthly_premium, presence: true
  validates :plan_name, presence: true
  has_many :user_plans, :class_name => "InterestedPlan", :dependent => :destroy
  has_many :applicants, :through => :user_plans, :source => :user
end
