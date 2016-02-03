class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :title
      t.text :content

      t.timestamps null: true
    end
  end
end
