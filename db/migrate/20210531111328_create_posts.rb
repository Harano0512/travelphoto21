class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :subject,        null: false
      t.date :travel_date,      null: false
      t.integer :prefecture_id, null: false
      t.text :article,          null: false
      t.references :user,       foreign_key: true
      t.references :content,    foreign_key: true
      t.timestamps
    end
  end
end