json.(article, :id, :title, :author_id, :created_at, :updated_at)

json.comments article.comments, partial: 'api/comments/comment', as: :comment
json.votecount article.votecount
json.taglist article.taglist
json.photo_url article.photo.url(:big)
json.htmlbody Article.htmlbody(article.body)
json.username User.find(article.author_id).username