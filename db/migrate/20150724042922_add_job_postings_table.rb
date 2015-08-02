class AddJobPostingsTable < ActiveRecord::Migration
  def change
  	create_table :job_postings do |t|
  		t.string :title, null:false
  		t.text :description, null:false
  		t.string :company_name, null:false
  		t.string :contact_email
  		t.string :source_domain, null: false
  		t.string :source_url, null:false

  		t.timestamps null: false
  	end
  end
end
