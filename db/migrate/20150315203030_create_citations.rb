class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.integer :article_citing
      t.integer :article_cited

      t.timestamps null: true
    end
  end
end
