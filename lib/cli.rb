class Cli

    def create_alchemists 
        Alchemist.create_alchemists(Webscraper.state_alchemists)
    end

    def start 
    create_alchemists 
    present_info
    end

    def present_info
    greeting
    list_all_alchemists
    instructions
    loop do 
        input = number_selection
        break if input == "exit"
        next if input == "invalid"
        list_a_alchemist(input)
        decision
        choice = second_selection
        break if choice == "exit"
        next if choice == "invalid" 
        chapter_info(input)
        second_decision
        second_choice = third_selection
        break if second_choice == "exit"
        next if second_choice == "invalid"
        character_info(input)
        
    end
    end

    def greeting
        puts "Welcome to the Full Metal Alchemist - State Alchemist database \n"
        puts "Information contained herein includes spoilers.\n"
        puts "Below is a list of all the currently known State Alchemists.\n"
    end

    def list_all_alchemists
        Alchemist.all.each_with_index do |alchemist, index|
        puts "#{index +1} - #{alchemist.name}"
        end
    end

    def instructions
    puts "If you want to see more information on one of the Alchemists listed above, please type in the Character's number as it appears above\n"
    puts "Within each selected Alchemist, you'll be able to request for further information - instructions will be given\n"
    puts "If you want to exit, please type in 'exit'.\n"
    end 

    
    def number_selection 
        input = gets.chomp 
        return input if input == "exit"
        if !valid?(input)
            puts "Please input a number between 1-14"
            return "invalid"
        end
        return input.to_i - 1 
    end 

    def valid?(input)
    if input.to_i > 0 && input.to_i < Alchemist.all.count
        true
    else
        false
    end
    end

    def second_selection
    selection = gets.chomp 
    return selection if selection == "no"
    return selection if selection == "exit"
    if !second_valid?(selection) 
        puts "Please either type in 'yes', 'no', or 'exit'."
        return "invalid selection. Please try again"
    end
    return selection
    end 

    def second_valid?(selection)
    if selection == "yes" 
        true 
    else
        false 
    end
    end

    def third_selection 
        second_choice = gets.chomp 
        return second_choice if second_choice == "exit" 
        return second_choice if second_choice == "restart" 
        if !third_valid?(second_choice) 
            puts "Please either type in 'yes', 'no', 'exit' or 'restart'."
            return "invalid" 
        end 
        return second_choice 
    end

    def third_valid?(second_choice) 
        if second_choice == "yes" 
            true 
        else
            false
        end
    end 


    def list_a_alchemist(input)
        Alchemist.all.each_with_index do |alchemist,i| 
            if input == i 
            puts "#{alchemist.name} has the title of #{alchemist.title}. #{alchemist.name} holds the rank of #{alchemist.rank} and first appears in #{alchemist.first_apperance}."
            end
        end
    end


    def decision
    puts "Do you want to read the Chapter summary"
    end

    def second_decision 
    puts "Do you want to read a Character summary?"
    end
        
    def chapter_info(input_number) 
    puts Alchemist.chapter_info(input_number)
    end
    
    def character_info(input_number)
    puts Alchemist.character_info(input_number)
    end


end 