# frozen_string_literal: true

class CreatePerson < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.timestamps
    end
  end
end
