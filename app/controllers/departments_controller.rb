class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@pagy, @departments = pagy(Department.all)
  end

  def new
  	@department = Department.new
  end

  def create
  	@department = Department.create(department_params)

  	if @department.save
  	  redirect_to departments_path, notice: "Department created successfully"
  	 else
  	  render :new
  	end
  end


  def edit
  	@department = Department.find(params[:id])
  end

  def update
  	@department = Department.find(params[:id])

  	if @department.update(department_params)
  	 redirect_to @department
  	else
  		render :edit
  	end
  end

  def destroy
   @department = Department.find(params[:id])

   @department.destroy
   redirect_to :action => :index 
  end

  private

  def department_params
  	params.require(:department).permit(:name)
  end
end
