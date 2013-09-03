class AddCurrentStatusToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :current_status, :integer
  end
end
