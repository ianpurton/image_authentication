class ImageAuthenticationAddToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :image_authentication_enabled, :default => false 
      t.integer :auth_categories_mask,         :default => 0
    end
  end
end