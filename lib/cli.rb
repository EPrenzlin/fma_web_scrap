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
        loop do 
            list_all_alchemists
            new_line
            instructions
            input = number_selection
            new_line
            break if input == "exit"
            next if input == "invalid"
            list_a_alchemist(input)
            new_line
            decision
            new_line
            choice = user_input
            new_line
            if choice == "yes"
                new_line
                character_info(input)
                new_line
                chapter_info(input)
            elsif choice == "no"
                    next
            elsif choice == "invalid"
                    next
            break if choice == "exit"

            end 
        end
    end
    
    def user_input
    choice = gets.chomp 
    if choice == "yes"
        return "yes"
    elsif choice == "no"
        return "no"
    elsif choice == "exit"
        return "exit"
    elsif choice != "yes"|| "no" || "exit"
        puts "Please enter a valid command - 'yes' or 'no'."
        user_input
    end
    end
    end
    

    def greeting
        new_line
        puts "Welcome to the Full Metal Alchemist - State Alchemist database.".red
        puts "Information contained herein includes spoilers.".red 
        puts "Below is a list of all the currently known State Alchemists.".red
        new_line
    end

    def list_all_alchemists
        Alchemist.all.each_with_index do |alchemist, index|
        puts "#{index +1} - #{alchemist.name}"
        end
    end

    def instructions
    new_line
    puts "If you want to see more information on one of the Alchemists listed above, please type in the Character's number only as it appears above"
    puts "Within each selected Alchemist, you'll be able to request for further information - instructions will be given"
    puts "If you want to exit, please type in 'exit'."
    new_line
    end 

    
    def number_selection 
        input = gets.chomp 
        return input if input == "exit"
        if !valid?(input)
            puts "Please input a number between 1-14 or exit."
            return "invalid"
        end
        return input.to_i - 1 
    end 

    def valid?(input)
    if input.to_i > 0 && input.to_i <= Alchemist.all.count
        true
    else
        false
    end
    end

    def list_a_alchemist(input)
        Alchemist.all.each_with_index do |alchemist,i| 
            if input == i 
            puts " \n Name: #{alchemist.name} \n Title: #{alchemist.title} \n Rank: #{alchemist.rank} \n First Apperance: #{alchemist.first_apperance}.".red
            end
        end
    end


    def decision
    puts "Do you want to read the Chapter && Character summary?".yellow
    puts "Type in 'yes' or 'no'".yellow 
    puts "If you type in 'no', we go back to the database selection page.".yellow
    end


        
    def chapter_info(input_number) 
    puts "Chapter info".red
    puts Alchemist.chapter_info(input_number)
    new_line
    end
    
    def character_info(input_number)
        puts "Character Info".yellow
    puts Alchemist.character_info(input_number)
    end

    def new_line 
        puts "\n\n"
    end