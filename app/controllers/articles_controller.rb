class ArticlesController < ApplicationController
	# require 'rspec'

	def index
		@newest = Article.order('created_at DESC').limit(12)
		@most_cited = Article.most_cited
	end

	def new
		if user_signed_in?	
			@article = Article.new
		else
			redirect_to '/users/sign_in'
		end
	end

	def edit
		if user_signed_in?
			@article = Article.find(params[:id])
		else
			redirect_to '/users/sign_in'
		end
	end

	def update
		@article = Article.find(params[:id])

		content = params[:content]
		link_data = content.scan(/\(.*?\)/)
		content_for_editing = content

		content = content.gsub("(", "<a href=\"").gsub(")", "\">").gsub("[", "").gsub("]", "</a>")

		all_citations = Citation.where(article_citing: params[:id]).destroy_all

						link_data.each do |link|
							if link.include? ("/articles/") 
								id = /\/.\d?\)/.match(link)
								id = id.to_s
								id = id.gsub("/", "").gsub(")", "").to_i
								Citation.create({:article_cited => id, :article_citing => @article.id})
							end
						end


		@article.update({:title => params[:title], :content => content, :content_for_editing => content_for_editing})
		
		flash[:success] = "changes saved"
		redirect_to '/articles/' + @article.id.to_s
	end

	def create
		content = params[:content]
				link_data = content.scan(/\(.*?\)/)

		content_for_editing = content

		content = content.gsub("(", "<a href=\"").gsub(")", "\">").gsub("[", "").gsub("]", "</a>")

		@article = Article.create({:title => params[:title], :content => content, :user_id => current_user.id, :content_for_editing => content_for_editing})
			
				link_data.each do |link|
					if link.include? ("/articles/") 
						id = /\/.\d?\)/.match(link)
						id = id.to_s
						id = id.gsub("/", "").gsub(")", "").to_i
						Citation.create({:article_cited => id, :article_citing => @article.id})
					end
				end

			flash[:success] = "article added"
			redirect_to '/articles/' + @article.id.to_s
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:success] = "article deleted"
		redirect_to '/articles'
	end

end

