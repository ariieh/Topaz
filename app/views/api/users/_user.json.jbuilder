json.(user, :id, :username, :email, :created_at, :updated_at, :provider, :uid)
json.notifications user.notifications, partial: 'api/notifications/notification', as: :notification
json.votes user.votes.map(&:article_id)
json.articles user.articles.map(&:id)