class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :evaluate
      t.integer :product_id

      t.timestamps
    end
  end
end
