class AddPostMailSettingToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :post_mail_setting, :string
  end
end
