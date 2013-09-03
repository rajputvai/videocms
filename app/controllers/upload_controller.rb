class UploadController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource :class => false

  def index
	  @video = Video.new()
	  @user_videos = current_user.videos.limit(20).page(params[:page]).per(5)
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id   
    @video.current_status = 1
    if @video.save
      @video.video_histories.create(:video_id => @video.id, :user_id => current_user.id, :video_status_id => 1)
      flash[:notice] = "Successfully uploaded your video."
      redirect_to :action => :index
    else
      render :action => 'new'
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :src)
  end

end
