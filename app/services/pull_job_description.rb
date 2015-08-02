class PullJobDescription
	def self.call(response)
		if response["text"].blank?
			url = response["url"]
		else
			response["text"]
		end
	end
end
