class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.references :user, null: false, foreign_key: true
      
      t.string :title
      t.text :detail
      t.date :start_ymd
      t.time :start_time
      t.string :duration
      t.string :event_cls
      t.string :train_strength
      t.string :place
      t.string :prefecture
      t.integer :join_limit

      t.timestamps
    end
  end
end
