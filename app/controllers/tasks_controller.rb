class TasksController < ApplicationController
  before_action :authorize
  skip_before_action :verify_authenticity_token
  # GET /tasks or /tasks.json
  def index
    render json: Task.all, status: :ok
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    task = set_task
    render json: task, status: :ok
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
   
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :description, :due_date, :status_id)
    end
    def authorize
      render json: {errors: ["Not authorized"]}, status: 401 unless session.include? :user_id
  end
end
