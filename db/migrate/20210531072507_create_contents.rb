class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title,   null: false
      t.date :from_date, null: false
      t.date :return_date, null: false
      t.references :user, foreign_key: true       
      t.timestamps
    end
  end
end
