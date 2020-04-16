
class Webscraper 


def self.state_alchemists
    fma_wiki = open("https://fma.fandom.com/wiki/Alchemist")
    wiki = Nokogiri::HTML(fma_wiki)
    array = [] 
    base_link = "https://fma.fandom.com/" 
    wiki.css("table tr").each_with_index do |info,index|
        next if index == 0 
        state_alchemist = {
            name: info.css("td").map(&:text)[0],
            title: info.css("td").map(&:text)[1],
            rank:info.css("td").map(&:text)[2],
            first_apperance:info.css("td").map(&:text)[3], 
            name_link:base_link+info.css("a").first["href"], 
            chapter_link:base_link+info.css("a").last["href"]
        }
     
            array << state_alchemist    
    end
    array
    # info.css("td").map(&:text) - gives us each of the texts
    # info.css("a").first["href"] - gives us the first link
end


# need to test the below two methods if they work as intended once Alchemist is instanciated
# def self.get_character_info(character_name)
#     get_details = state_alchemists.detect{|a|a.name == character}
#      fma_wiki = open(get_details[:name_link])
#     character_website = Nokogiri::HTML(fma_wiki)
#     introduction = character_website.css("#mw-content-text p").text
#     introduction
# end 
# probs be a class method for the Alchemist class



# def self.get_chapter_summary(character_name)
# get_details = state_alchemist.detect(|a|a.name == character_name) 
# fma_wiki = open(get_details[:chapter_link]
# wiki = Nokogiri::HTML(fma_wiki)
# chapter= wiki.css("#mw-content-text p").text
# chapter
# end


end
#class end - do not touch.