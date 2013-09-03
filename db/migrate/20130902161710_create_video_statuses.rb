class CreateVideoStatuses < ActiveRecord::Migration
  def change
    create_table :video_statuses do |t|
	  t.string :name
      t.timestamps
    end
  end
end
