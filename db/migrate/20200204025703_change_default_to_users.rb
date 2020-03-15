# frozen_string_literal: true

class ChangeDefaultToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :post_mail_setting, :string, default: false
    add_column :users, :post_mail_setting, :integer, defalut: 0
  end
end
