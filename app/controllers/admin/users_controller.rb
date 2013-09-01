class Admin::UsersController < ApplicationController
  before_filter :get_user, :only => [:index,:new,:edit]
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create]
  load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]
 
  def index

    @users = User.accessible_by(current_ability, :index).limit(20)
    respond_to do |format|
      format.html
    end
  end
 
  def new
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html      
    end
  end
 
  def edit
    respond_to do |format|
      format.html
    end
  end
 
  def destroy
    @user.destroy!
 
    redirect_to admin_users_path
  end

  def update
    if params[:user][:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| params[:user].delete(p) }
    else
      @user.errors[:base] << "The password you entered is incorrect" unless @user.valid_password?(params[:user][:current_password])
    end
 
    respond_to do |format|
      if @user.errors[:base].empty? and @user.update_attributes(user_params)
        flash[:notice] = "Your account has been updated"
        format.html { render :action => :edit }
      else
        format.html { render :action => :edit, :status => :unprocessable_entity }
      end
    end
 
    rescue ActiveRecord::RecordNotFound
      respond_to_not_found(:html)
  end
 
  def create

    @user = User.new(user_params)
 
    if @user.save
      respond_to do |format|
        format.html { redirect_to :action => :index }
      end
    else
      respond_to do |format|
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end
  
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end

  def get_user
    @current_user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:display_name, :email, :password, :salt, :encrypted_password, :password_confirmation, {:role_ids => []})
  end

end