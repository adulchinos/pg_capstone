json.array! @comments do |comment|

	json.id comment.id
	json.comment comment.comment
	json.article_id comment.article_id
	json.user_id comment.user_id

end