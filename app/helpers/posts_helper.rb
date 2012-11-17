require 'uri'

module PostsHelper
	def comments(post)
		"comment".pluralize(post.comments.size)
	end

	def uri_short(url)
		URI(url).host.gsub("www.", "")
	end

	def post_number(counter)
		if params[:page]
			(params[:page].to_i - 1) * 30 + counter
		else
			1 * counter
		end
	end
end
