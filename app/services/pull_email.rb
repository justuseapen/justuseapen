class PullEmail
	def self.call(text)
		email_regex = Regexp.new(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/)
		emails = text.scan(email_regex).uniq 
	end
end
