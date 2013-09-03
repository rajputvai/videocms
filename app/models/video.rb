class Video < ActiveRecord::Base
	has_many :video_histories
	belongs_to :user

	default_scope order("id DESC")

	validates :title, 
	  presence: true,
      format: { with: /\A[a-zA-Z ]+\z/, message: "only letters and space allowed" }

    validates :description, 
      presence: true,
      format: { with: /\A[a-zA-Z ]+\z/, message: "only letters and space allowed" }

    mount_uploader :src, VideoUploader

end
