class Cli

    def start 
    create_alchemists 
    user_selection
    end

    def user_selection
    greeting
    list_all_alchemists
    instructions
    list_character(input = gets.chomp)
    end

    def create_alchemists 
        Alchemist.create_alchemists(Webscraper.state_alchemists)
    end


    def list_character(character_name = gets.chomp)
        if Alchemist.verify?(character_name)
        list_single_alchemist(character_name)
        end 
    end   

    def greeting
        puts "Welcome to the Full Metal Alchemist - State Alchemist database \n"
        puts "Information contained herein includes spoilers. You have been warned \n"
    end

    def instructions
    puts "If you want to see more information on one of the Alchemists listed above, please type in the Character's number as it appears above\n"
    puts "Within each selected Alchemist, you'll be able to request for further information\n"
    puts "If you want to exit, please type in 'exit'.\n"
    end 

    def list_all_alchemists
    Alchemist.all.each_with_index do |alchemist, index|
    puts "#{index +1} - #{alchemist.name}"
    end
    end


    def list_single_alchemist(character_name)
    alchemist = Alchemist.all.detect{|a|a.name.include?(character_name)}
    puts "#{alchemist.name} is known as #{alchemist.title}.#{alchemist.name} holds the rank of #{alchemist.rank} and first appears in #{alchemist.first_apperance}."
    end


    def do_you_want_chapter_info?(inputs = gets.chomp)
    
    end
        
    def chapter_info(character_name) 
    Alchemist.get_chapter_info(character_name)
    end
    
    def character_info(character_name)
    Alchemist.get_character_info(character_name)
    end


end 