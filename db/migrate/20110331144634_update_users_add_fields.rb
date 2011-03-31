class UpdateUsersAddFields < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_column :users, :title, :string
    add_column :users, :financial_institution, :string
    add_column :users, :phone, :string
  end

  def self.down
  end
end
