class CreateVideoHistories < ActiveRecord::Migration
  def change
    create_table :video_histories do |t|
	  t.references :video, index: true
	  t.references :video_status, index: true
	  t.references :user, index: true
      t.timestamps
    end
  end
end
