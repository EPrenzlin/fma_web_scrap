
class Web_scraper 

def self.get_jutsu_link
big_links = open("https://naruto.fandom.com/wiki/Special:BrowseData/Jutsu?limit=500&offset=0&_cat=Jutsu&Media=Manga")
naruto_technique = Nokogiri::HTML(big_links)
binding.pry
end 


end