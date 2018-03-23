class CreateNotifiables < ActiveRecord::Migration[5.1]
  def change
    create_table :notifiables do |t|
      t.string :notifiable_type

      t.timestamps
    end
  end
end
