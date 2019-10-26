class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|

      t.timestamps null: true
      t.string :name
      t.text :text
      t.text :image
    end
  end
end