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
​
    # while true do
      current_page = agent.get(domain + next_url)
      # activeクラスがあったらフラグを立てる
      active_flag = 0
      # li内のリンクを全て取得する
      elements = current_page.search('.pagination li')
      elements.each do |element|
          # もしactiveフラグがオンだったらリンクを取得する(activeクラスを持った次のliは次へのリンクなはず)
          if active_flag == 1
            next_link = element.at("a")["href"]
            break
          end
          # liにactiveクラスがついていたらフラグを立てる
          if element.first.present? && element.first[1] == "active"
            active_flag = 1
          end
      end
      default_page = default_page + page_count
      # 「/read0170729/published_papers?limit=20&offset=21」と表示させたい
      p next_link
    # ​end
  end
end
