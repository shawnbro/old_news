# article_helper.rb
module ArticleHelper

   def get_front_page_articles(year, month, day)
    headline_and_lead_paragraph = {}
    date = year.to_s + month.to_s + day.to_s

    results = [0, 1].map do |page|
      HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=document_type:article&begin_date=#{date}&end_date=#{date}&page=#{page}&api-key=#{NYTIMES_API_KEY}")["response"]["docs"]
    end.flatten

    if results.count == 0
      generate_date
    else
      articles = results.map do |result|
        Hash["headline", result["headline"], "lead_paragraph", result["lead_paragraph"], "pub_date", result["pub_date"]]      
      end

      return articles.uniq
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
end