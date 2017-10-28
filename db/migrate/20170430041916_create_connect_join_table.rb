class CreateConnectJoinTable < ActiveRecord::Migration[5.0]
  def change
    def change
      create_table 'connects' do |t|
        t.integer 'connecting_id', :null => false
        t.integer 'connector_id', :null => false

        t.timestamps null: false
      end
      add_index :connects, :connecting_id
      add_index :connects, :connector_id
      add_index :connects, [:connecting_id, :connector_id], unique: true
    end
  end
end
