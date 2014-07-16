json.articles do
	json.array! @articles.articles, partial: "api/articles/article", as: :article
end

json.page_number @page
json.total_pages @articles.total_pages