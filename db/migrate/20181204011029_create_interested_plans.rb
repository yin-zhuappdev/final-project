class CreateInterestedPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :interested_plans do |t|
      t.integer :insurance_plan_id
      t.integer :user_id

      t.timestamps
    end
  end
end
