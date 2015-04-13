class UsersController < ApplicationController
	
	def show
		@user = User.find(current_user.id)
		@articles = User.find(current_user.id).articles
	end

end