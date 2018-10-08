class AddUserIdToLeaves < ActiveRecord::Migration[5.2]
  def change
    add_reference :leaves, :user
  end
end
