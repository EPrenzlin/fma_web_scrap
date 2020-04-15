
class Webscraper 

def self.state_alchemists
fma_wiki = open("https://fma.fandom.com/wiki/Alchemist")
wiki = Nokogiri::HTML(fma_wiki)
array = [] 
state_alchemsit = {} 
counter = 0 
while counter <= 13 
    info_array = wiki.css("table tr")[counter +1].text.strip.split("\n")
        state_alchemist = { 
        name: info_array[0],
        title: info_array[1],
        rank: info_array[2],
        first_apperance: info_array[-1],
    }
    array << state_alchemist
    counter +=1
end
array
end 


def self.links
#gets all the links for the character & the chapter they first appear in
fma_wiki = open("https://fma.fandom.com/wiki/Alchemist")
wiki = Nokogiri::HTML(fma_wiki)
array = [] 
base_link = "https://fma.fandom.com/"
wiki.css("table tr a").each do|links| 
array << base_link+links.attr("href")
end 
array
end 





end