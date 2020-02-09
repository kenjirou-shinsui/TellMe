class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :title
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
