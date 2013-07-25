class SecretsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :index }
      format.json { render :json => Secret.all }
    end
  end

  def create
    @secret = current_user.authored_secrets.new(params[:secret])
    @secret.recipient_id = params[:user_id]
    @secret.save
    respond_to do |format|
      format.json { render :json => {secret: @secret, tags: @secret.tags} }
      format.html { redirect_to user_url(params[:user_id]) }
    end
  end
end
