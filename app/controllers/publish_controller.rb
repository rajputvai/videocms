class PublishController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource :class => false

  def index
  	@pending_videos = Video.where(current_status: 3).page(params[:page1]).per(5)
  	@my_videos = current_user.video_histories.where(video_status_id: 4).page(params[:page2]).per(5)
  end

  def status
  	video = Video.find(params[:video_id])
  	if video
  	  video.update_attribute(:current_status, 4)
      video.video_histories.create(:video_id => video.id, :user_id => current_user.id, :video_status_id => 4, :comment => params[:comment])
      flash[:notice] = "Successfully published."
      redirect_to :action => :index
    else
      flash[:notice] = "Video not found, Please try again."
      redirect_to :action => :index
    end
  end
end
