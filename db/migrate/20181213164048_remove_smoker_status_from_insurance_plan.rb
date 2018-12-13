class RemoveSmokerStatusFromInsurancePlan < ActiveRecord::Migration[5.1]
  def change
    remove_column :insurance_plans, :smoker_status
  end
end
