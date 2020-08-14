require 'mechanize'
class Scrapethe < ApplicationRecord
    def self.the_urls
    agent = Mechanize.new
    page = agent.get("https://japanuniversityrankings.jp/universities/1290/")
    elements = page.search('//*[@id="bar_env"]')
    p elements.inner_text
  end
end
