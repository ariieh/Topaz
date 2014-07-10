# Topaz

* A Backbone.js-based clone of the popular business news site [Quartz](http://qz.com/) with Medium-style blogging features
* Implements site-wide Kaminari-based infinite scroll drawing from Active Record and custom SQL queries
* Utilizes custom-built Markdown-based text editor with live HTML text and image preview
* Live searches and highlights full article text with prioritized PgSearch query

Website live on [http://www.topaz.ninja/](http://www.topaz.ninja/). Suggested demo path:

* Sign in as demo user (click the "demo user" button in the sign-in modal)
* Click around on the different view filters (popular, votecount, favorites)
	* Scroll to the bottom to see infinite scroll in action!
	* And try navigating with the sidebar.
* Try sorting by tag, then try searching by a tag that isn't there (click the little white search icon directly to the right of the tag label), e.g. "apple". Infinite scroll here too when applicable.
* Try clicking the white search icon in the navbar and searching for something, e.g. "google". Infinite scroll here too when applicable.
* Click the dashboard link in the dropdown menu in the uppermost righthand corner of the page to go to your dashboard.
* Create a new article; watch the live preview in action!
* On submit, try favoriting and commenting on your new article; watch notifications be added in the navbar and the article's votecount increase in the sidebar.
	* Try deleting the article (via the link in the sidebar); its associated notification will go away.
* Once you finally get tired of the site, hit ctrl-a to have a little bit of fun! (Refresh and/or click on the page if nothing happens.)