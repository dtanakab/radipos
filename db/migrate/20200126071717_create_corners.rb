# frozen_string_literal: true

class CreateCorners < ActiveRecord::Migration[6.0]
  def change
    create_table :corners do |t|
      t.string :title
      t.string :subject
      t.text :introduction
      t.integer :alive_flag
      t.timestamps
    end
  end
end
