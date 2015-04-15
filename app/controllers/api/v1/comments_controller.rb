class Api::V1::CommentsController < ApplicationController

	def index
		@comments = Comment.where(article_id: params[:article_id])
	end

	def create	
		@new_comment = Comment.create({:article_id => params[:article_id], :user_id => current_user.id, :comment => params[:comment]})
		@comments = Comment.where(article_id: params[:article_id])
	end
end
