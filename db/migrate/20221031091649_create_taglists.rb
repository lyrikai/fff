class CreateTaglists < ActiveRecord::Migration[7.0]
  def change
    create_table :taglists do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :gossip, index: true

      t.timestamps
    end
  end
end
