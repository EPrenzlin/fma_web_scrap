class Alchemist 

@@all = [] 

def self.all 
    @@all 
end

def self.find_by_title(title)
    self.all.detect{|alchemist|alchemist.title.include?(title)}  
end

def self.find_by_rank(rank) 
self.all.select{|a|a.rank.include?(rank)}
end 


def self.create_alchemists(array_of_hashes)
    array_of_hashes.each do |hash| 
    new(hash)
    end 
end

def self.valid?(input)

end

def self.chapter_info(number) 
Webscraper.get_chapter_info(Alchemist.all[number.to_i].name)
end

def self.character_info(number) 

end 



attr_accessor :name, :rank, :title, :chapter_link, :name_link, :first_apperance

def initialize(name: nil, rank: nil , title: nil , name_link: nil, chapter_link: nil, first_apperance: nil)
    @name = name 
    @rank = rank 
    @title = title
    @chapter_link = chapter_link
    @name_link = name_link
    @first_apperance = first_apperance
    @@all << self
end

end
