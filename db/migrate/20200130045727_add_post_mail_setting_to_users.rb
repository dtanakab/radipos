class AddPostMailSettingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :post_mail_setting, :string
  end
end
