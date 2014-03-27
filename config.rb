# encoding: utf-8

###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :compressed
end

###
# Deploying
###
activate :deploy do |deploy|
  deploy.method = :git
end

###
# Page options, layouts, aliases and proxies
###
page "/presen/*", :layout => :presen

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload
activate :directory_indexes

# Methods defined in the helpers block are available in templates
helpers do
  def fa(name)
    "<i class='fa fa-#{name}'></i>"
  end

  def presen_img(name, option = {})
    path = current_page.path
    image_tag "presen/#{path[path.index('/') + 1...path.rindex('.')]}/#{name}", option
  end
end

###
# Gem
###
require 'slim'

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
