class RemoveWdayToPrograms < ActiveRecord::Migration[6.0]
  def change
    remove_column :programs, :wday, :integer
  end
end
