class RemovePendingActiveCompleteColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :job_status, :integer
    remove_column :jobs, :active
    remove_column :jobs, :completed
    remove_column :jobs, :pending
  end
end
