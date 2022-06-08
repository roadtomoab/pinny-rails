class CreatePins < ActiveRecord::Migration[7.0]
  def change
    create_table :pins do |t|
      t.string :title
      t.string :desc
      t.integer :latitude
      t.integer :longitude
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
