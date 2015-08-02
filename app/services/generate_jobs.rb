class GenerateJobs
	def self.call(item_ids,host_url)
		item_ids.each do |item_id|
			source_domain = host_url
			source_url = "https://hacker-news.firebaseio.com/v0/item/#{item_id}.json"
			response = JSON.parse(Net::HTTP.get(URI.parse(source_url)))
			title = response['title']
			job_description = PullJobDescription.call(response)
			company_name = PullCompanyName.call(response)
			email = PullEmail.call(job_description) unless job_description.blank?
			job = JobPosting.new(title: title, 
													 description: job_description,
													 source_url: source_url,
													 source_domain: source_domain,
													 company_name: company_name,
													 email: email)
			job.save
		end
	end
end