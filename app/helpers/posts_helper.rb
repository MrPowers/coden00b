require 'uri'

module PostsHelper
	def comments(post)
		"comment".pluralize(post.comments.count)
	end

	def uri_short(url)
		URI(url).host
	end
end
