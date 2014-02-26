class CreateCustomSearch < ActiveRecord::Migration
  def change
    create_table :custom_searches do |t|
      t.references :user
      t.date :date
    end
  end
end
