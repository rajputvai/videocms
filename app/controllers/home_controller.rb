class HomeController < ApplicationController
  def index
	@videos = Video.where(current_status: 4).page(params[:page]).per(5)
  end
end
