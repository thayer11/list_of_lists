class RandosController < ApplicationController

	def create
    	@rando = Rando.create(rando_params)
    	redirect_to "/lists/#{@rando.list_id}"
    end

    def new
    	@rando = Rando.new
    	render :new 
	end

    def edit
    	@rando = Rando.find_by_id(params[:id])
    	render :edit
    end

    def update
    	@rando = Rando.find_by_id(params[:id])
    	@list.update_attributes(rando_params)
    	redirect_to "/lists/#{@rando.list_id}"
    end

    def destroy
    	@rando = Rando.find_by_id(params[:id])
    	@rando.destroy
    	redirect_to "/lists/#{@rando.list_id}"
	end 

private
	def rando_params
		params.require(:rando).permit(:title, :description, :img_url, :link_url, :list_id)
	end
end

