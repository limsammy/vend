class MachineSnack < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_snacks do |t|
      t.belongs_to :snack, index: true
      t.belongs_to :machine, index: true
      t.timestamps
    end
  end
end
