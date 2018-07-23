class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html, except: [:create, :update, :complete]
  respond_to :js, except: [:destroy, :new, :edit]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all.order(:position)
    respond_with(@tasks)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show; end

  # GET /tasks/new
  # If a position is created, makes it equal to max index + 1. If nil, makes it 1
  def new
    @task = Task.new(position: current_position)
  end

  # GET /tasks/1/edit
  def edit; end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.save
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.update(task_params)
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.mark_complete!
    respond_with(@task)
  end

  def sort
    params.require(:task)

    params[:task].each_with_index do |id, index|
      Task.where(id: id).update_all(position: index + 1)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def current_position
    return 1 if Task.all.empty?
    Task.maximum('position') + 1
  end

  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:position, :title, :is_done)
  end
end
