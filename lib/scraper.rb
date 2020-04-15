
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
        first_apperance:info_array[-1]
    }
    array << state_alchemist
    counter +=1
    # wiki.css("table tr").each_with_index do|state_alchemist, index| 
    # info_array = wiki.css("table tr")[index+1].text.strip.split("\n")
    # state_alchemist = { 
    #     name: info_array[0],  
    #     title: info_array[1],
    #     rank: info_array[2],
    #     first_apperance:info_array[-1]
    # }
    # array << state_alchemist
end
array
end 

def self.laws 
#gives us the laws of state_alchemsits!
end

def self.definition
    #definition of alchemist provided
end


end