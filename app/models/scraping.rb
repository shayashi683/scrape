require 'mechanize'
class Scraping < ApplicationRecord
    def self.fuga_urls
    agent = Mechanize.new
    links = []
    next_url = ""
    while true
      current_page = agent.get("https://researchmap.jp/read0170729/published_papers?limit=20&offset=1" + next_url)
      elements = current_page.search('li a')
      elements.each do |ele|
        links << ele.get_attribute('href')
      end
      next_link = current_page.at('//*[@id="frame-19159"]/div/div[2]/nav/nav/ul/li[6]/a')
      p next_link
      break unless next_link
      next_url = next_link.get_attribute('href')
      p "aaa"
      p next_url
    end
    p elements.inner_text
  end
end
