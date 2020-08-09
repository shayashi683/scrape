require 'mechanize'
class Scraping < ApplicationRecord
  def self.fuga_urls
    agent = Mechanize.new
    # 変数定義
    domain = "https://researchmap.jp"
    default_page = 1
    page_count = 20
    next_url = "/read0170729/published_papers?limit=20&offset=#{default_page}"
    next_link = ""
