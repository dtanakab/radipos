# frozen_string_literal: true

class ChangeDataToPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :post_mail_setting, :string, default: false
    add_column :posts, :post_mail_setting, :integer, defalut: 0
  end
end
