class Article < ActiveRecord::Base
	has_many :citings, class_name: 'Citation', foreign_key: :article_citing
	has_many :citeds, class_name: 'Citation', foreign_key: :article_cited
	belongs_to :user




def self.most_cited
	articles = self.all
    
    cited = {} 

		articles.each do |article| 
			cited[article.id] = article.citeds.count 
		end
		x = cited.sort_by { |id, count| count } 

		most_cited = [] 

		x.each do |inside_x|
			most_cited << inside_x[0] 
		end

		most_cited.reverse!
		result = []
		most_cited.each do |id|
			result << Article.find(id)
		end

		result.first(12)
end





end
