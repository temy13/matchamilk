class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :part_id
      t.string :comment

      t.timestamps null: false
    end
  end
end
