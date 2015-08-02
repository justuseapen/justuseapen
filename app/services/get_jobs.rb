class GetJobs
	include Service
	def call
		uri = URI.parse('https://hacker-news.firebaseio.com/v0/jobstories.json')
		host = uri.host
		item_ids = JSON.parse(Net::HTTP.get(uri))
		GenerateJobs.call(item_ids,host)
	end
end
