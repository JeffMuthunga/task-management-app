require 'sendgrid-ruby'
include SendGrid
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]


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
  def create
    user = User.create!(user_params)
    if user.persisted?
      RegistrationMailer.registration_email(user).deliver_now
      render json: user, status: :created
    else
      render json: {error: "User not created"}, status: :unprocessable_entity
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
end
