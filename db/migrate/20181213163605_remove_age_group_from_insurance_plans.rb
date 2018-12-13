class RemoveAgeGroupFromInsurancePlan < ActiveRecord::Migration[5.1]
  def change
    remove_column :insurance_plans, :age_group
  end
end
