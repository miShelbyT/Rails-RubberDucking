class DucksController < ApplicationController

  def index
    @ducks = Duck.all
	end
	
	def new
		@duck = Duck.new
	end

  def show
    @duck = Duck.find(params[:id])
  end

  def edit
    @duck = Duck.find(params[:id])
	end
	
	def create
		@duck = Duck.create(duck_params)

		if @duck.valid?
      redirect_to duck_path(@duck)
    else
      flash[:user_errors] = @duck.errors.full_messages
      redirect_to new_duck_path
    end

	end

  def update
    @duck = Duck.find(params[:id])
    
    # if @duck.update
      @duck.update(duck_params)
      redirect_to duck_path(@duck)
    # else
    #   redirect_to duck_path(@duck)
    # end 

  end

  
  private 
  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
    # params.require(:duck).permit!
  end

  def duck_name_params
    params.require(:duck).permit(:name)
    # params.require(:duck).permit!
  end





end
