class CreateHopeQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :hope_questions do |t|
      t.integer :user_id
      t.text :hope_body
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
