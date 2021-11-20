class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :marktsegment
      t.text :help
      t.string :keywords

      t.timestamps
    end
  end
end
