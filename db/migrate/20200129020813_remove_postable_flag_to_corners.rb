# frozen_string_literal: true

class RemovePostableFlagToCorners < ActiveRecord::Migration[6.0]
  def change
    remove_column :corners, :postable_flag, :integer
  end
end
