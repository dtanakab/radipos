# frozen_string_literal: true

class RemoveUnpostableReasonFromCorners < ActiveRecord::Migration[6.0]
  def change
    remove_column :corners, :unpostable_reason, :string
  end
end
