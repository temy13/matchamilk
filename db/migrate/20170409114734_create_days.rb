class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.datetime :p_date
      t.string :comment

      t.timestamps null: false
    end
  end
end
