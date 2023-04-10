class CreatePaddocks < ActiveRecord::Migration[7.0]
  def change
    create_table :paddocks do |t|
      t.string :name
      t.references :park
      t.integer :power
      t.integer :capacity

      t.timestamps
    end
  end
end
