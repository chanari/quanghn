class CreateShortLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :short_links do |t|
      t.string :short_path, null: false
      t.string :original_url, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :short_links, :short_path, unique: true
    add_index :short_links, [:original_url, :user_id], unique: true
  end
end
