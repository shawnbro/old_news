# welcome_controller.rb
class WelcomeController < ApplicationController
  def index
    @articles = generate_date
  end


private

  def get_front_page_articles(year, month, day)
    articles = []
    headline_and_lead_paragraph = {}
    date = year.to_s+month.to_s+day.to_s
    #returns front page news from a specific date
    nyt_results = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=document_type:article&begin_date=#{date}&end_date=#{date}&api-key=70c6055f9f80068e5a9a5058008bfa37:13:68818454")
    # headline_and_lead_paragraph
    i = 0
    while i < nyt_results["response"]["docs"].count
      nyt_results["response"]["docs"].each do |result|
        article_info =  Hash["headline", result["headline"], "lead_paragraph", result["lead_paragraph"], "pub_date", result["pub_date"]]
        articles.push(article_info)
      end
      i += 1
    end
    articles.uniq!
  end

  def generate_date
    month = Time.new.month
    if month < 10
      month = "0" + month.to_s
    end
    day = Time.new.day
    if day < 10
      day = "0" + day.to_s
    end
    year = 1850 + rand(164)
    get_front_page_articles(year, month, day)
  end
end