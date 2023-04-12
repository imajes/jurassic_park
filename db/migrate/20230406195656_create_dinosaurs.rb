# frozen_string_literal: true

class CreateDinosaurs < ActiveRecord::Migration[7.0]

  def change
    create_table :dinosaurs do |t|
      t.string :name
      t.references :paddock
      t.integer :type
      t.integer :species
      t.integer :gender
      t.timestamp :born_at

      t.timestamps
    end
  end

end
