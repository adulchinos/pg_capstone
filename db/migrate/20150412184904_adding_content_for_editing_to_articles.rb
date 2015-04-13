class AddingContentForEditingToArticles < ActiveRecord::Migration
  def change
  	change_table :articles do |t|
  		t.text :content_for_editing
  	end
  end
end
