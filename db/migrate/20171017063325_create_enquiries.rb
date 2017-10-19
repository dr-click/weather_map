class CreateEnquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :enquiries do |t|
      t.string :country
      t.string :city
      t.json :results, default: {}
      t.datetime :last_update_at

      t.timestamps
    end
  end
end
