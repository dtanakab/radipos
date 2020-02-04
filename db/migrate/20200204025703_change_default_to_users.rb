# frozen_string_literal: true

class ChangeDefaultToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :post_mail_setting, :integer, defalut: 0
  end
end
