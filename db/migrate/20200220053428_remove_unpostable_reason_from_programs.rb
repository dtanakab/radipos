# frozen_string_literal: true

class RemoveUnpostableReasonFromPrograms < ActiveRecord::Migration[6.0]
  def change
    remove_column :programs, :unpostable_reason, :string
  end
end
