class AddDefaultJobStatus < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :job_status
    add_column :jobs, :job_status, :integer,default: 0
  end
end
