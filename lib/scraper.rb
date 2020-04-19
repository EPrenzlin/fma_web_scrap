class Webscraper 


def self.state_alchemists
    fma_wiki = open("https://fma.fandom.com/wiki/Alchemist")
    wiki = Nokogiri::HTML(fma_wiki)
    array = [] 
    base_link = "https://fma.fandom.com/" 
    wiki.css("table tr").each_with_index do |info,index|
        next if index == 0 
        state_alchemist = {
            name: info.css("td").map(&:text)[0].chomp,
            title: info.css("td").map(&:text)[1].chomp,
            rank:info.css("td").map(&:text)[2].chomp.lstrip.chomp,
            first_apperance:info.css("td").map(&:text)[3].chomp, 
            name_link:base_link+info.css("a").first["href"].chomp, 
            chapter_link:base_link+info.css("a").last["href"].chomp
        }
     
            array << state_alchemist    
    end
    array
    # info.css("td").map(&:text) - gives us each of the texts
    # info.css("a").first["href"] - gives us the first link
end


def self.get_character_info(link)
    fma_wiki = open(link)
    character_website = Nokogiri::HTML(fma_wiki)
    p_one = character_website.css("#mw-content-text p")[0].text
    p_two = character_website.css("#mw-content-text p")[1].text
    together = p_one + p_two 
    puts together    
end 


def self.get_chapter_info(link)
fma_wiki = open(link)
chapter_website = Nokogiri::HTML(fma_wiki)
    if chapter_website.css("#mw-content-text p").text.split("\n").join != ""
    chapter_website.css("#mw-content-text p").text.split("\n").join
    else 
    puts "This chapter has not been written on our wiki page. We apologise"
end
end


end
#class end - do not touch.