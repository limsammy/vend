class CreateJoinTableMachinesSnacks < ActiveRecord::Migration[5.1]
  def change
    create_join_table :machines, :snacks do |t|
      t.index :machine_id
      t.index :snack_id
    end
  end
end
