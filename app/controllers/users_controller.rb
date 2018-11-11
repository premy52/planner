class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

	def new
    @user = User.new # for SSL on custom domain name at Heroku, see https://devcenter.heroku.com/articles/ssl-endpoint 
	end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "User #{@user.email} created"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def index
   @users = User.order(:email)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "User #{@user.email} was successfully updated" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    # params.require(:user).permit(:email, :password_digest)
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end

    def set_user
      @user = User.find(params[:id])
    end

end
