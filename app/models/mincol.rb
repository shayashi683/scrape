class Mincol < ApplicationRecord
    def self.mincol_urls
    agent = Mechanize.new
    page = agent.get("https://www.minkou.jp/university/school/20476/")
    total_points = page.search('.schMod-school-point span')
    p total_points.inner_text
    life_points = page.search('//*[@id="js-scroll-anchor-section-review"]/div[1]/div/div[2]/ul/li[7]/div[2]')
    p life_points.inner_text.gsub(/[^\d]/,'')
    facil_points = page.search('//*[@id="js-scroll-anchor-section-review"]/div[1]/div/div[2]/ul/li[5]/div[2]')
    p facil_points.inner_text.gsub(/[^\d]/,'')
  end
end
