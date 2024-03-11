class AddFacebookAccessTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :facebook_access_token, :string
  end
end
