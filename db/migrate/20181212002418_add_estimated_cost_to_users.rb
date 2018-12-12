class AddEstimatedCostToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :estimated_cost, :integer
  end
end
