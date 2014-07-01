json.(article, :id, :title, :body, :author_id, :created_at, :updated_at)

json.comments article.comments, partial: 'api/comments/comment', as: :comment
json.votes article.votes, partial: 'api/votes/vote', as: :vote
json.taglist article.taglist
json.photo_url article.photo.url(:big)
json.htmlbody article.htmlbody