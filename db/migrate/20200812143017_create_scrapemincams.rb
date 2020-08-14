class CreateScrapemincams < ActiveRecord::Migration[5.2]
  def change
    create_table :scrapemincams do |t|

      t.timestamps
    end
  end
end
