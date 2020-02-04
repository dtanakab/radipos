# frozen_string_literal: true

class ChangeDataToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :post_mail_setting, :integer, defalut: 0
  end
end
