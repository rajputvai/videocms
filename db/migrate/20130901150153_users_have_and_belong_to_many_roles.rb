class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
  create_table :roles_users, :id => false do |t|
      t.references :role, :user
  end
end