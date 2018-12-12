class CreateInsurancePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :insurance_plans do |t|
      t.float :coinsurance_paid_by_patient
      t.float :deductible
      t.float :monthly_premium
      t.string :plan_name
      t.integer :age_group

      t.timestamps
    end
  end
end
