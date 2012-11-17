require 'uri'

module PostsHelper
	def comments(post)
		"comment".pluralize(post.comments.size)
	end

	def uri_short(url)
		URI(url).host.gsub("www.", "")
	end
end
