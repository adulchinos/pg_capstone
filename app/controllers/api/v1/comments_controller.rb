class Api::V1::CommentsController < ApplicationController

	def show
		@comments = Comment.where()
	end

	def create	
		@new_comment = Comment.create({:article_id => params[:article_id], :user_id => current_user.id, :comment => params[:comment]})
		redirect_to "/articles/#{params[:article_id]}"
	end
end
