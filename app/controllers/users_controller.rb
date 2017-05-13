class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    country = Country.where(iso: params[:country][:id])
    if country.empty?
      country_select = ISO3166::Country[params[:country][:id]]
      country = Country.create(iso: params[:country][:id], name: country_select.name)
    else
      country = country.first
    end
    @user = User.new(user_params)
    @user.password = "#{@user.name}#{@user.surname}#{(Random.new).rand(0..1000)}"
    @user.country = country

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def home
    notifications = Notification.limit(Notification.limit_records).order(start_date: :desc)
    gon.offset = Notification.limit_records
    gon.notifications_path = url_for(action: 'index', controller: 'notifications', only_path: true)
    gon.send_content_path = url_for(action: 'send_content', controller: 'contents', only_path: true)
    @notifications_month = notifications.group_by { |t| t.start_date.beginning_of_month }
  end

  def get_cognito_token
    cognito =  Aws::CognitoIdentity::Client.new
    identity_pool_id = 'us-west-2:d2b55f0f-9d2c-423d-84fc-6ea0ace7eaa3'
	  cog = cognito.get_open_id_token_for_developer_identity({identity_pool_id: identity_pool_id, logins: {'login.evd.iniciados': current_user.id.to_s}})
	  respond_to do |format|
  	  format.json do
        render json: { 'aws_credentials': cog, 'identity_pool_id': identity_pool_id }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :surname, :email, :password, :country_id, :lesson_id, :level_id)
    end
end
