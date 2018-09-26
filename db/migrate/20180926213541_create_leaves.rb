class CreateLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|

      t.timestamps
    end
  end
end
