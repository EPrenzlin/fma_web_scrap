class Cli

    def create_alchemists 
        Alchemist.create_alchemists(Webscraper.state_alchemists)
    end

    def start 
    create_alchemists 
    user_selection
    end

    def user_selection
    greeting
    list_all_alchemists
    instructions
    list_a_alchemist(input = gets.chomp)
    see_more(input= gets.chomp)
    end

    def greeting
        puts "Welcome to the Full Metal Alchemist - State Alchemist database \n"
        puts "Information contained herein includes spoilers.\n"
    end

    def instructions
    puts "If you want to see more information on one of the Alchemists listed above, please type in the Character's number as it appears above\n"
    puts "Within each selected Alchemist, you'll be able to request for further information - instructions will be given\n"
    puts "If you want to exit, please type in 'exit'.\n"
    end 

    def list_all_alchemists
        Alchemist.all.each_with_index do |alchemist, index|
        puts "#{index +1} - #{alchemist.name}"
        end
    end


    def valid?(input = gets.chomp)
        input = input.to_i
        if input > 0 && input <= Alchemist.all.count
            true
        else
            puts "Please input a number between 1 - 14"
        end
    end

    def list_a_alchemist(index)
        if valid?(index)
            actual_index = index.to_i - 1
            Alchemist.all.each_with_index do |alchemist,i| 
            if actual_index == i 
            puts "#{alchemist.name} has the title of #{alchemist.title}. #{alchemist.name} holds the rank of #{alchemist.rank} and first appears in #{alchemist.first_apperance}."
            end
            end
        end
    end

    def see_more(input = gets.chomp)
        puts "Do you want to read about the character or chapter?"
        if input == "yes" 
            decision
        elsif input != "yes"
            puts "Please either type in 'yes' or 'no'."
        elsif input == "no"

        end
    end

    def decision(input = gets.chomp)
    puts "Do you want to read the chapter summary"
        if input == "yes" 
            provide_chapter_info(number)
        elsif input == "no"
            puts "Do you want to read the character info?"
            if input == "yes"
                provide character_info(number)
            end
        elsif input == "no"
            puts "Thanks - back to main menu then"
            user_selection 
        elsif input != "yes"|| "no"
            puts "Please either type in a 'yes' or 'no'"

        end
    end

        
    def provide_chapter_info(input_number) 
    link = Alchemist.chapter_link(number)
    Alchemist.get_chapter_info(link)
    end
    
    def character_info(input_number)
    link = Alchemist.character_info(number)
    Alchemist.get_character_info(link)
    end


end 