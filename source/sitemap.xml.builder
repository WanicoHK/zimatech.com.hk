xml.instruct!
xml.urlset xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  [
    '/',
    '/showroom.html',
  ].each do |url|
    xml.url do
      xml.loc "https://www.zimatech.com.hk#{url}"
      xml.lastmod Date.today.to_time.iso8601
      xml.changefreq 'weekly'
      xml.priority url == '/' ? 1 : 0.5
    end
  end

  sitemap.resources.select do |page|
    page.path.end_with?('.html') && page.data.noindex != true
  end.sort_by do |page|
    [ page.url.size, page.url ]
  end.each do |page|
    xml.url do
      xml.loc "https://www.zimatech.com.hk#{page.url}"
      xml.lastmod Date.today.to_time.iso8601
      xml.changefreq page.data.changefreq || 'weekly'
      xml.priority page.data.priority || 0.5
    end
  end
end
