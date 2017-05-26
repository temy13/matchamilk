class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :member_id
      t.integer :day_id
      t.integer :status_cd

      t.timestamps null: false
    end
  end
end
