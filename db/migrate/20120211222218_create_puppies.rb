class CreatePuppies < ActiveRecord::Migration
  def change
    create_table :puppies do |t|
      t.string :url
      t.string :name
      t.string :major
      t.string :minor

      t.timestamps
    end
  end
end
