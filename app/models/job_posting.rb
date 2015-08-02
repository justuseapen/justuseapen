class JobPosting < ActiveRecord::Base
	validates :title, presence: true
	validates :description, presence: true
	validates :company_name, presence: true
	validates :source_domain, presence: true
	validates :source_url, presence: true
end