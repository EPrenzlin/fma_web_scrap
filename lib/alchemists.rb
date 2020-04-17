class Alchemist 

@@all = [] 

def self.all 
    @@all 
end

#list them by rank
#list them by alphabetical order 
#list them by apperance in chapters


def self.create(array_of_hashes)
    array_of_hashes.each do |hash| 
        new(hash)
    end 
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
