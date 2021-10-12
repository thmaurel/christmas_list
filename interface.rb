# interface.rb

require_relative 'christmas.rb'

# STEP2: Define the gift list (put some gifts inside)
# gift_list = ['Playstation', 'car', 'house', "telephone", "pull", "jean"]

# STEP5: Update the gift_list to take status into account
gift_list = [
    {name: "Playstation", bought: true},
    {name: "Car", bought: false}
]

# Display a welcome message
puts "Welcome on your gift list!"
# Initialize the user answer
choice = ''
# Loop until the user wants to quit
until choice == 'quit'
    # Ask the user what he wants to do [list / add / delete / quit]
    puts "Which action [list|add|delete|quit]?"
    # Get his choice into a variable
    choice = gets.chomp
    # If he wants to list all gifts
    if choice == 'list'
        list(gift_list)
    # else if he wants to add a gift
    elsif choice == 'add'
       add(gift_list)
    # else if he wants to delete a gift
    elsif choice == 'delete'
        delete(gift_list)
    # STEP 5: Add a statement for mark as bought
    elsif choice == 'mark'
        mark(gift_list)
    # else if he wants to look for ideas
    elsif choice == "idea"
        idea(gift_list)
    # else if he wants to quit
    elsif choice == 'quit'
        # # Display 'Good bye'
        puts 'GoodBye'
    # else
    else
        # Display an error message
        puts "Try again!"
    end
# End the loop
end
