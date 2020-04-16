class Alchemist 

@@all = [] 

def self.all 
    @@all 
end

def self.mass_create_alchemists(array_of_hashes)
    array_of_hashes.each do |hash| 
        new(hash)
    end 
end

attr_accessor :name, :rank, :title, :chapter_link, :name_link

def initialize(name:, rank:, title:, name_link:, chapter_link:)
    @name = name 
    @rank = rank 
    @title = title
    @@all << self
end

end
