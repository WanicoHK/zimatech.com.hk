helpers do
  def asset_data_uri(path)
    resource = sitemap.find_resource_by_path(path)
    return path if resource.nil?
    content = ::File.read(resource.source_file)
    base64 = ::Base64.strict_encode64(content)
    "data:#{resource.content_type};base64,#{::Rack::Utils.escape(base64)}"
  end

  def nav_link_to(text, link)
    link_to text, link, class: current_page.url.include?(link) ? 'active' : ''
  end

  def meta_description
    key = current_page.data.description_key
    content = if key
                t(key)
              elsif current_page.data.description
                current_page.data.description
              else
                'ZIMA, ZIMA官网, ZIMA官網'
              end
    tag(:meta, name: 'description', content: content)
  end

  def meta_page_title
    key = current_page.data.title_key
    content = if key
                t(key)
              elsif current_page.data.title
                current_page.data.title
              else
                'ZIMA, ZIMA官网, ZIMA官網'
              end
    tag(:meta, name: 'page-title', content: content)
  end

  def meta_keywords
    key = current_page.data.keywords_key
    content = if key
                t(key)
              elsif current_page.data.keywords
                current_page.data.keywords
              else
                'ZIMA, ZIMA官网, ZIMA官網'
              end
    tag(:meta, name: 'keywords', content: content)
  end

  def title
    key = current_page.data.title_key
    content = if key
                t(key)
              elsif current_page.data.title
                current_page.data.title
              else
                'ZIMA, ZIMA官网, ZIMA官網'
              end
    content_tag(:title, content)
  end

end

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

configure :build do
  activate :asset_hash
end

activate :i18n, locales: [ :'en-US', :'zh-HK', :'zh-CN' ], path: '/:locale/', mount_at_root: false

configure :development do
  redirect 'index.html', to: '/zh-HK/'
end

# build sitemap
require 'builder'

# activate :livereload

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
