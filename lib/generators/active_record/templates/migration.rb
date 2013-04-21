class ImageAuthenticationAddTo<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    change_table :<%= table_name %> do |t|
      t.boolean :image_authentication_enabled, :default => false 
      t.integer :auth_categories_mask,         :default => 0
    end
  end
end