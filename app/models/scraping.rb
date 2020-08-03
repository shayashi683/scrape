require 'mechanize'
class Scraping < ApplicationRecord
    def self.fuga_urls
        # mechanizeを開始
​
        # Mechanize定義
        agent = Mechanize.new
​
        # ドメイン名定義
        domain = "https://researchmap.jp"
        next_url = "/read0170729/published_papers?limit=20&offset=1" #1ページ目
​
        # 無限ループしてしまうと相手のサイトに迷惑をかけてしまうのでまずは次のページへのリンクを取得できるか
        # だけ確認するために、whileはコメントアウト
        #while true
            # ページを取得する
            current_page = agent.get(domain + next_url)
​
            # activeクラスがあったらフラグを立てる
            active_flag = 0
​
            # li内のリンクを全て取得する
            elements = current_page.search('li')
            elements.each do |element|
                # もしactiveフラグがオンだったらリンクを取得する(activeクラスを持った次のliは次へのリンクなはず)
                if active_flag == 1
                    next_link = element.get_attribute('href')
                    break
                end
​
                # liにactiveクラスがついていたらフラグを立てる(element.classが動くか微妙...)
                if element.class == "active"
                    active_flag = 1
                end
            end
​
            # 「/read0170729/published_papers?limit=20&offset=21」と表示させたい
            p next_link
        #end
​
        # mechanize終了
    end
<<<<<<< HEAD
end
=======
end
>>>>>>> 75681ffc084797ad470fcb389b4e0ba862785add
