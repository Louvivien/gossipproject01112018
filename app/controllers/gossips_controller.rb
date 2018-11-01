class GossipsController < ApplicationController
	def index
		@gossip = Gossip.all
	end
	def new
		@gossip = Gossip.new
	end
	def create
		
		if @current_user
			@gossip = Gossip.create!(title: params[:gossip][:title], content: params[:gossip][:content], anonymous_gossiper: params[:gossip][:anonymous_gossiper],  user_id: @current_user.id)
		else
			@gossip = Gossip.new
			flash[:info] = "Veuillez vous identifier avant de créer un potin"
			redirect_to "/users/login"

		end
	end

	def show
		@gossip = Gossip.find(params[:id])
	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		if @current_user
			@gossip = Gossip.find(params[:id])
			@gossip = Gossip.update!(title: params[:gossip][:title], content: params[:gossip][:content], anonymous_gossiper: params[:gossip][:anonymous_gossiper], user_id: @current_user.id)
			redirect_to gossips_path
		else
			@gossip = Gossip.new
			flash[:info] = "Veuillez vous connecter afin de modifier un potin"
			redirect_to "/users/login"
		end
	end

	def destroy
		
	if @current_user

		@gossip = Gossip.find(params[:id])
	    @gossip.destroy
	    redirect_to gossips_path

		else
			@gossip = Gossip.new
			flash[:info] = "Veuillez vous identifier afin de supprimer un potin"
			redirect_to "/users/login"

		end




	end
end