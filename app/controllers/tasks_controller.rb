class TasksController < ApplicationController
    before_action :get_category
    before_action :set_task, only: [:show, :edit, :update, :destroy]


 
  def index
    @category_tasks = @category.tasks
    # @category_tasks = @category.tasks.where(:deadline => Date.today)
    
    
  end

  def alltasks
    
  end

  def show

  end

  def new
    # @task = Task.new
    @category_task = @category.tasks.build
  end

  def edit
    # @category_task = @category.tasks.build(task_params)
    @category_task = @category.tasks.find(params[:id])
  end

  def create
    @category_task = @category.tasks.build(task_params)
    respond_to do |format|
      if @category_task.save
          format.html { redirect_to category_tasks_path(@category), notice: 'Task was successfully created.' }
          format.json { render :show, status: :created, location: @category_task }
      else
          format.html { render :new }
          format.json { render json: @category_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

      respond_to do |format|
        if @category_task.update(task_params)
          format.html { redirect_to category_tasks_path(@category), notice: 'Task was successfully updated.' }
          format.json { render :show, status: :ok, location: @category_task }
        else
          format.html { render :edit }
          format.json { render json: @category_task.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy

    @category_task.destroy

    respond_to do |format|
      format.html { redirect_to category_tasks_path(@category), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_category
      @category = Category.find(params[:category_id])

    end

    def set_task
      @category_task = @category.tasks.find(params[:id])
    # @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:task_name,:desc,:deadline,:status)
      # params.permit(:data)
    end
end
