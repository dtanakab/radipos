# frozen_string_literal: true

class ChangeDataToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :post_mail_setting, :integer
  end
end
