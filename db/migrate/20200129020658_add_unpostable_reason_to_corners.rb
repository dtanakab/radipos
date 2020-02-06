# frozen_string_literal: true

class AddUnpostableReasonToCorners < ActiveRecord::Migration[6.0]
  def change
    add_column :corners, :unpostable_reason, :string
  end
end
