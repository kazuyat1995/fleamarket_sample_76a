json.id @comment.id
json.comment @comment.comment
json.user_id @comment.user.id
json.item_id @comment.item.id
json.created_at @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.user_nickname @comment.user.nickname
json.current_user current_user.id
json.seller @seller.id