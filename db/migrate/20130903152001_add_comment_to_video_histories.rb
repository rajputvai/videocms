class AddCommentToVideoHistories < ActiveRecord::Migration
  def change
    add_column :video_histories, :comment, :text
  end
end
