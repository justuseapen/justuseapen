class PullCompanyName

	def self.call(response)
		tr_uri = URI.parse("http://api.textrazor.com")
		http = Net::HTTP.new(tr_uri.host, tr_uri.port)
		request = Net::HTTP::Post.new("/")
		if response["text"].blank?
			request.set_form_data({ apiKey: ENV["TEXTRAZOR_API_KEY"],
															url: response['url'],
															extractors: "entities"
															})
		else
			request.set_form_data({ apiKey: ENV['TEXTRAZOR_API_KEY'],
															text: response['text'],
															extractors: "entities"
															})
		end
		json_response = JSON.parse(http.request(request).body)
		entities = json_response["response"]["entities"]
		entities.each do |e|
			if e["type"].present?
				if e["type"] == "company" 
					return company_name = e["matchedText"]
				end
			end
		end
	end

end