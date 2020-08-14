class CreateMincols < ActiveRecord::Migration[5.2]
  def change
    create_table :mincols do |t|

      t.timestamps
    end
  end
end
