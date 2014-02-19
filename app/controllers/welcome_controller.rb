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
    nyt_results = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=document_type:article&begin_date=#{date}&end_date=#{date}&page=0&api-key=#{NYTIMES_API_KEY}")
    nyt_results2 = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=document_type:article&begin_date=#{date}&end_date=#{date}&page=1&api-key=#{NYTIMES_API_KEY}")
    # headline_and_lead_paragraph

    if nyt_results["response"]["docs"].count == 0
      generate_date

    else

      i = 0
      while i < nyt_results["response"]["docs"].count
        nyt_results["response"]["docs"].each do |result|
          article_info =  Hash["headline", result["headline"], "lead_paragraph", result["lead_paragraph"], "pub_date", result["pub_date"]]
          articles.push(article_info)
        end
        i += 1
      end
      i = 0
      while i < nyt_results2["response"]["docs"].count
        nyt_results2["response"]["docs"].each do |result|
          article_info =  Hash["headline", result["headline"], "lead_paragraph", result["lead_paragraph"], "pub_date", result["pub_date"]]
          articles.push(article_info)
        end
        i += 1
      end
      articles.uniq!
    end
    
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

  def load_user
    return @user = User.find(params[:id])
  end
end