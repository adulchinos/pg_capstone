class InformationsController < ApplicationController
	def show
		@info = Information.find(params[:id])
	end
end
