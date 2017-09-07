class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
    	t.string :name
    	t.text :description
    	t.string :location
    	t.date :start_date
    	t.date :end_date
     	t.string :status, index: true
    	t.boolean :deleted, default: false, index: true

      t.timestamps
    end
  end
end
