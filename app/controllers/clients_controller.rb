class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :unique_auth_token, only: [:create]

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:email, :password_digest)
    end

    def unique_auth_token
      unique_auth = false
      while unique_auth == false
        auth_key = SecureRandom.base64.tr('+/=', 'Qrt')
        if !Client.all.where(auth_token: auth_key).any?
          unique_auth = true
          return auth_key
        end
      end
    end

end
