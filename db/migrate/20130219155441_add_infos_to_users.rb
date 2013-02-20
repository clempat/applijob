class AddInfosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :picture, :string
    add_column :users, :address_street, :string
    add_column :users, :address_zip, :string
    add_column :users, :address_city, :string
    add_column :users, :telephone, :string
    add_column :users, :mobile, :string
    add_column :users, :fax, :string
  end
end
