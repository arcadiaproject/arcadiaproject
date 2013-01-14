#Markdown
set :markdown_engine, :redcarpet

#Livereload
activate :livereload


activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = "master"
  deploy.remote = "build"
end

Time.zone = "Rome"

activate :blog do |blog|
   #blog.prefix = "blog"
    blog.permalink = "blog/:year/:month/:day/:title.html"
    blog.sources = "articles/:year-:month-:day-:title.html"
   # blog.taglink = "tags/:tag.html"
   blog.layout = "layout"
   #blog.summary_separator = /(READMORE)/
  #  blog.summary_length = 250
  #  blog.year_link = ":year.html"
  #  blog.month_link = ":year/:month.html"
  #  blog.day_link = ":year/:month/:day.html"
  #  blog.default_extension = ".markdown"
  # 
   blog.tag_template = "tag.html"
   blog.calendar_template = "calendar.html"
  # 
  #  blog.paginate = true
  #  blog.per_page = 10
  #  blog.page_link = "page/:num"
end

page "/feed.xml", :layout => false
page "/", :layout => :html5

page "/eventi.html", :layout => :html5

# page "/list"

page "/tracks/track.html", :layout => :html5
# page "/bestiarum.html", :layout => :html5
page "/tracks/eventi/evento.html", :layout => :html5

page "/contattaci.html", :layout => :html5

data.actors.friends.each do |name|
  proxy "/#{name}.html", "/actor.html", :locals => { :person_name => name }, :ignore => true
end

### 
# Compass
###

# Susy grids in Compass
# First: gem install susy
require 'susy'
#require "middleman-smusher"
# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :fonts_dir, 'fonts'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
   activate :minify_css
  
  # Minify Javascript on build
   activate :minify_javascript
  
  # Create favicon/touch icon set from source/favicon_base.png
   activate :favicon_maker
  
  # Enable cache buster
   activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
