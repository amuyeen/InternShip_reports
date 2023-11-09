require 'nokogiri'
require 'open-uri'

class VNExpressNokogiri
  def initialize(url)
    @doc = Nokogiri::HTML(URI.open(url))
  end

  def print_article_titles
    puts 'Tieu de bai bao:'
    @doc.css('h2.title-news a').each do |link|
      puts link.content
    end
    puts '======================================'
  end

  def print_article_urls
    puts 'Link URL:'
    @doc.css('h2.title-news a').each do |link|
      href_value = link['href']
      puts href_value
    end
    puts '======================================'
  end

  def print_article_descriptions
    puts 'Mieu ta cua bai bao'
    @doc.css('p.description a').each do |link|
      puts link.content
    end
    puts '======================================'
  end
end


vnexpress = VNExpressNokogiri.new('https://vnexpress.net/so-hoa/cong-nghe/ai')
vnexpress.print_article_titles
vnexpress.print_article_urls
vnexpress.print_article_descriptions