class Comment < ApplicationRecord
    validates :user_id, presence: true
    validates :insurance_plan_id, presence: true
    validates :body, presence: true
    belongs_to :insurance_plan, :class_name => "Insurance", :foreign_key => "insruance_plans_id" 
    belongs_to :user, :class_name => "User", :foreign_key => "user_id" 
end