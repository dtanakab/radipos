class ChangeAboutAgeToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :about_age, :integer
  end
end
