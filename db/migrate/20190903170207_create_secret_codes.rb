class CreateSecretCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :secret_codes do |t|
      t.string :code
      t.integer :user_id
      
      t.timestamps
    end
    add_index :secret_codes, :user_id
  end
end
