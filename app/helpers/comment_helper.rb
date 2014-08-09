module CommentHelper
	def hasnt_commented?(user_id , comments)
		comments.each do |comment|
			if comment.user_id == user_id
				return false
			else
				return true
			end
		end
	end
end