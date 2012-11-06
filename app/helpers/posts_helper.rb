module PostsHelper
	def comments(post)
		"comment".pluralize(post.comments.count)
	end
end
