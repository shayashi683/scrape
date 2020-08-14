require 'mechanize'
class Scrapemincam < ApplicationRecord
  def self.mincam_urls
    agent = Mechanize.new
    page = agent.get("https://campus.nikki.ne.jp/?module=lesson&univ=%BC%A2%B2%EC%C2%E7%B3%D8&lname=%C3%DD%C2%BC&fname=%BE%B4%C4%CC")
    agent.page.encoding = "eucJP-MS"
    elements = page.search('//*[@id="apartValue"]/ul/li/dl/dd[2]/span/img[1]')
    p elements
  end
end
