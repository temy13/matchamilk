class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :specific

      t.timestamps null: false
    end
  end
end
