class Citation < ActiveRecord::Base
	belongs_to :citing, foreign_key: :article_citing, class_name: "Article" 
	belongs_to :cited, foreign_key: :article_cited, class_name: "Article"
end
