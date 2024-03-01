# class TasksController < ApplicationController
#   before_action :authenticate_user!
  
#     def index
# 	  	# @tasks = Task.all
# 	    @tasks = current_user.tasks.page(params[:page])
# 	    render json: @tasks
#     end 

# 	def create
# 	  	@task = current_user.tasks.new(task_params)
# 	  	if @task.save
# 	    	render json: @task, status: :ok

# 		else
# 			render json: @task.errors, status: :unprocessable_entity
# 		end 
#     end 


#   private 

#   def task_params
#   	params.require(:task).permit(:title, :description, :status)
#   end 

# end


# app/controllers/tasks_controller.rb

class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.page(params[:page])
    render json: @tasks
  end

  def show
    @task = current_user.tasks.find(params[:id])
    render json: @task
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end
