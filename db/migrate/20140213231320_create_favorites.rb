class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.text :headline
      t.text :lead_paragraph
      t.date :pub_date
      t.references :user
    end
  end
end
