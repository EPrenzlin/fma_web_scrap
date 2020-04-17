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
def self.get_character_info(character_name)
    get_details = Alchemist.all.detect{|a|a.name.include?(character_name)}
    fma_wiki = open(get_details.name_link)
    character_website = Nokogiri::HTML(fma_wiki)
    p_one = character_website.css("#mw-content-text p")[0].text
    p_two = character_website.css("#mw-content-text p")[1].text
    together = p_one + p_two 
    puts together    
end 


def self.get_chapter_info(character_name)
get_details = Alchemist.all.detect{|a|a.name.include?(character_name)} 
fma_wiki = open(get_details.chapter_link)
chapter_website = Nokogiri::HTML(fma_wiki)
if chapter_website.css("#mw-content-text p").text.split("\n").join != ""
chapter_website.css("#mw-content-text p").text.split("\n").join
else 
    puts "This chapter does not have the info you want"
end
end


end
#class end - do not touch.