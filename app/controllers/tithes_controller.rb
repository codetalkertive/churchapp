class TithesController < ApplicationController
  def index
  	@tithes = Tithe.all
  end

  def show
  end

  def edit
  end

  def new
  	@tithe = Tithe.new
  end

  def create
  	@tithe = Tithe.create(tithe_params)

  	if @tithe.save
  		redirect_to :action => :index
  	else
  		render :new
  	end
  end

  private

  def tithe_params
  	params.require(:tithe).permit(:membership_id, :amount)
  end
end