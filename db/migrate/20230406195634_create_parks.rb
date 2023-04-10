class CreateParks < ActiveRecord::Migration[7.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :host_country
      t.string :corporate_entity
      t.boolean :online, default: false
      t.date :launched_at
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
end
