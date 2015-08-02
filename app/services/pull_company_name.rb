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
			byebug
		else
			request.set_form_data({ apiKey: ENV['TEXTRAZOR_API_KEY'],
															text: response['text'],
															extractors: "entities"
															})
		end

		# capitalized_words_regex = Regexp.new('[A-Z][a-z]{2,}')
	end
end