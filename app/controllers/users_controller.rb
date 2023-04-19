class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    render json: User.all, status: :ok
  end

  # GET /users/1 or /users/1.json
  def show
    user = set_user
    render json: user, status: :ok
  end

  def usertasks
    user = User.find(params[:id])
    usertasks= user.tasks
    render json: usertasks, status: :ok
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email_address, :password_digest, :updated_at, :deleted_at)
    end
end
