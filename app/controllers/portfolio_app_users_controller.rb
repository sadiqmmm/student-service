class PortfolioAppUsersController < ApplicationController
  before_action :set_portfolio_app_user, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_app_users
  def index
    @portfolio_app_users = PortfolioAppUser.all
  end

  # GET /portfolio_app_users/1
  def show
  end

  # GET /portfolio_app_users/new
  def new
    @portfolio_app_user = PortfolioAppUser.new
  end

  # GET /portfolio_app_users/1/edit
  def edit
  end

  # POST /portfolio_app_users
  def create
    @portfolio_app_user = PortfolioAppUser.new(portfolio_app_user_params)

    if @portfolio_app_user.save
      redirect_to @portfolio_app_user, notice: 'Portfolio app user was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /portfolio_app_users/1
  def update
    if @portfolio_app_user.update(portfolio_app_user_params)
      redirect_to @portfolio_app_user, notice: 'Portfolio app user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /portfolio_app_users/1
  def destroy
    @portfolio_app_user.destroy
    redirect_to portfolio_app_users_url, notice: 'Portfolio app user was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_app_user
      @portfolio_app_user = PortfolioAppUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_app_user_params
      params.require(:portfolio_app_user).permit(:email, :password_digest, :role)
    end
end
