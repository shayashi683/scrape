class CreateScrapethes < ActiveRecord::Migration[5.2]
  def change
    create_table :scrapethes do |t|

      t.timestamps
    end
  end
end
