# db/migrate_create_listings.rb
require 'active_record'

class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :username
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

# Run the migration
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/listings.db')
CreateListings.new.change
