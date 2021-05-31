class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title,   null: false
      t.date :dep_date, null: false
      t.date :arv_date, null: false
      t.references :user, foreign_key: true       
      t.timestamps
    end
  end
end
