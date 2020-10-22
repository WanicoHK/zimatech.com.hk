xml.instruct!
xml.urlset xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  sitemap.resources.select { |page| page.path.end_with?('.html') && page.data.noindex != true }.each do |page|
    xml.url do
      xml.loc "https://www.zimatech.com.hk#{page.url}"
      xml.lastmod Date.today.to_time.iso8601
      xml.changefreq page.data.changefreq || 'weekly'
      xml.priority page.url == '/' ? 1 : page.data.priority || '0.5'
    end
  end

  [
    '/',
    '/showroom.html',
  ].each do |url|
    xml.url do
      xml.loc "https://www.zimatech.com.hk#{url}"
      xml.lastmod Date.today.to_time.iso8601
      xml.changefreq 'weekly'
      xml.priority url == '/' ? 1 : '0.5'
    end
  end
end
