class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = exception.message
    redirect_to root_url
  end

  def after_sign_in_path_for(resource)
  	if resource.role? :admin
  	  admin_users_path
  	elsif resource.role? :uploader
  	  upload_index_path
  	elsif resource.role? :verifier
  	  verify_index_path
  	elsif resource.role? :editor
  	  edit_index_path
  	elsif resource.role? :publisher
  	  publish_index_path
  	end
  end

end
