class VideoStatus < ActiveRecord::Base	
	has_many :video_histories 
end
