class ArticlesController < ApplicationController
	require 'rspec'

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.create({:title => params[:title], :content => params[:content]})
			flash[:success] = "article added"
			redirect_to '/articles/' + @article.id.to_s
	end

	def show
		@article = Article.find(params[:id])
	end
end
