class AddedUserNameToTableForUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :user_name
  	end
  end
end
