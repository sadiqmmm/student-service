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
    client = Client.create!(
      email: params['client']['email'],
      password: params['client']['password'],
      password_confirmation: params['client']['password_confirmation'],
      auth_token: unique_auth_token
    )

    if client
      session[:client] = client.id
      render json: { status: :created }
      # TODO
      # create current_user endpoint
      # https://www.owasp.org/index.php/HttpOnly
      #
      #cookies["dashtrack_user_id"] = { value: user.id, httponly: true }
    else
      render json: { status: 500 }
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
      params.require(:client).permit(
        :email,
        :password_digest,
        :subdomain
      )
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
