class ButtonsController < ApplicationController

  def index
	@buttons = Button.all
  end

  def new
  	@button = Button.new
  end

  def create
  	@button = Button.new(button_params)
    @button.user_id = current_user.id
  	if @button.save
  		redirect_to my_counters_path, notice: "Your new Button was added."
  	else
  		flash[:error] = "Error creating button. Please try again."
  		redirect_to my_counters_path
  	end
  end

  def destroy
    @button = Button.find(params[:id])
    if @button.destroy
      redirect_to my_counters_path, notice: "Button was destroyed successfully."
    else
      flash[:error] = "There was an error in destoying this button. Please try again."
      redirect_to my_counters_path
    end
  end

  def reset
  	@buttons = Button.all #need all for current user!
  	if @buttons.reset
  	  @buttons.update_attribute(:hits, 0)
  	  redirect_to my_counters_path, notice: "All counters have been reset."
  	else
  	  flash[:error] = "There was an error in resetting the counters. Please try again."
      redirect_to my_counters_path
    end
  end

  def show
  	@button = Button.find(params[:id])
  end

  def update
  	@button = Button.find(params[:id])
  	cur = @button.hits
  	new_hit = cur + 1
  	if @button.update_attributes(button_params)
  	  @button.update_attribute(:hits, new_hit)
  	  redirect_to my_counters_path, notice: "All counters have been reset."
  	else
  	  flash[:error] = "There was an error in resetting the counters. Please try again."
      redirect_to my_counters_path
    end
  end


  def button_params
    params.require(:button).permit(:title, :hits, :user_id)
  end

end