class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :author_url
      t.string :author_email
      t.boolean :approved
      t.string :referrer
      t.string :user_agent
      t.string :user_ip
      t.text :content

      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
