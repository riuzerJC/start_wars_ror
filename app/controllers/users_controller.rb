class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # Auth /users/1
  def authenticate
    @user.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { message: 'login successful' }, status: :ok
    else
      render json: { error: 'Incorrect username or password' }, status: :unauthorized
    end
  end

  def reset_password
    @user.find_by(email: params[:email])
    if user
      user.password = params[:password]
      if user.save
        render json: { message: 'Password reset successfully' }
      else
        render json: { error: 'Could not save password' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      unless @user
        render json: { error: "The user don't exits" }, status: :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
