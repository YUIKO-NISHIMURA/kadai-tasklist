class RemoveUserIdIdFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :user_id_id, :string
  end
end
