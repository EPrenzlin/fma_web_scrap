
class Webscraper 

def self.state_alchemists
fma_wiki = open("https://fma.fandom.com/wiki/Alchemist")
wiki = Nokogiri::HTML(fma_wiki)
array = [] 
state_alchemsit = {} 
counter = 0 
while counter <= 8
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


def self.all_links
#gets all the links for the character & the chapter they first appear in
fma_wiki = open("https://fma.fandom.com/wiki/Alchemist")
wiki = Nokogiri::HTML(fma_wiki)
array = [] 
original_array = [] 
base_link = "https://fma.fandom.com/"
wiki.css("table tr a").each do|links| 
array << base_link+links.attr("href")
end 
array
array.each_with_index do |info,index| 
if index <18
    original_array << info
end
end
original_array
end 

#for each chapter link, get the volume and series info back for the user 
#for each character, some info from each link to return back to the user 

def self.character_links
    personal_links = [] 
    all_links.each_with_index do |a,index|
    if index == 0 || index.even? 
    personal_links << a
    end
    end
personal_links
end


def self.chapter_links 
    chapter_links = [] 
    all_links.each_with_index do |a,index| 
        if index.odd? 
            chapter_links << a 
        end
    end
chapter_links
end

def self.chapter_summary
array = [] 
chapter_links.each do |a|
fma_wiki = open(a)
wiki = Nokogiri::HTML(fma_wiki)
info = {
chapter_summary: wiki.css("#mw-content-text p").text
}
array << info 
end
array 
end


end
#class end - do not touch.