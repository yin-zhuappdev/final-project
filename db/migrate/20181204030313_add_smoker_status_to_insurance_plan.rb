class AddSmokerStatusToInsurancePlan < ActiveRecord::Migration[5.1]
  def change
    add_column :insurance_plans, :smoker_status, :boolean
  end
end
