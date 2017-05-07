class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @customers = User.all.active.customers.alphabetical
    @employees = User.all.active.employees.alphabetical
  end

  def customers
    @customers = User.all.active.customers.alphabetical
  end

  def employees
    @employees = User.all.active.employees.alphabetical
  end

  def show
    @order_history = (current_user.orders.chronological.to_a unless current_user.nil?)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, notice: "Thank you for signing up!"
    else
      flash[:error] = "This user could not be created."
      render "new"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Successfully updated #{@user.name}."
    else
      render action: 'edit'
    end
  end

  # def destroy
  #   @user.destroy
  #   redirect_to items_path, notice: "Successfully removed #{@item.name} from the system."
  # end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password)
  end
  
end