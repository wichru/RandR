# frozen_string_literal: true

class CreateUserLeavesRequest < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.date :start_date
      t.date :end_date
      t.integer :total_days
      t.integer :user_id
      t.integer :admin_id
      t.boolean :status, default: false 
      t.string :leave_type
      t.text :reason_for_leave
      t.text :reason_for_rejection

      t.timestamps
    end
  end
end
