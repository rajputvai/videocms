class VideoHistory < ActiveRecord::Base
  belongs_to :video
  belongs_to :video_status
  belongs_to :user

  default_scope order("id DESC")
  
end
