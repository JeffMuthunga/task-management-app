require 'sendgrid-ruby'
include SendGrid
class UsersController < ApplicationController
  before_action :authorize
  skip_before_action :authorize, only: [:create]
  skip_before_action :verify_authenticity_token


  # GET /users or /users.json
  def index
    render json: User.all, status: :ok
  end

  # GET /users/1 or /users/1.json
  def show
    user = set_user
    if user
      render json: user, status: :ok
    else
      render json: {error: "User not found"}, status: 401
    end
  end

  def usertasks
    user = User.find(params[:id])
    usertasks= user.tasks
    render json: usertasks, status: :ok
  end
  def create
    user = User.create!(user_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: {error: "User Invalid"}, status: :unprocessable_entity
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email_address, :password)
    end

    def authorize
      render json: {errors: ["Not authorized"]}, status: 401 unless session.include? :user_id
    end
end
