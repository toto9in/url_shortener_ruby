URL Shortener
Requirements
[x] Submit a url in a form on the homepage
[x] Url is saved to the database
[x] The URL can be viewed by accessing a Base62 encoded primary key ID (short code) of the URL at /v/:id
[x] A user should be able to copy the short URL to the clipboard
[x] When visiting the short code, a view is recorded so we can keep track of how many views per day a link gets
[x] A total number of views should be saved to the URL record
[x] A user should be able to view a graph of the views over the past 2 weeks
[x] A user should be able to edit and delete the URL
[x] We should also retrieve the title, description, and opengraph image for the HTML document
[x] This should run in the background to keep the application fast
[x] If a URL is edited, we should update the title, description, and image for it
[x] We should paginate this list of shortened URLs