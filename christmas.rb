# christmas.rb
require 'open-uri'
require 'nokogiri'

# STEP2: Refacto the list action in a method
def list(gift_list)
    # STEP2: Iterate over the array (with the index)
    gift_list.each_with_index do |gift, index|
        # STEP2: Display the index and the name of the gift
        # STEP5: Update the printed string to display the status and the name
        # STEP5: It should look like  "1 - [X] sockets"
        puts "#{index + 1} - [#{gift[:bought] ? "X" : " "}] #{gift[:name]}"
    end
end

# STEP 3.5: Refactor the add in a method
def add(gift_list)
    # STEP 3: display the list
    list(gift_list)
    # STEP 3: Ask the user what he wants to add to his gift
    puts "What do you want to add?"
    # STEP 3: Store his answer into a variable
    new_gift = gets.chomp
    # STEP 3: Add his answer to the gift list
    # STEP 5: We want to push a hash into the list, we need to transform new_gift
    gift_list << {name: new_gift, bought: false}
    # STEP 3: Tell him it was added successfully
    puts "#{new_gift} has been succesfully added!"
end

#STEP 4.5: Refactor the delete method

def delete(gift_list)
    # gift_list = ['Playstation', 'car', 'house', "telephone", "pull", "jean"]
    # STEP4: Display the gift list
    list(gift_list)
    # STEP4: Ask the user which item he wants to delete (index)
    puts "Which item do you want to delete? (give index)"
    # STEP4: Store his answer into a variable (it should be an integer)
    index_to_delete = gets.chomp.to_i - 1
    # STEP4: Delete the item from the gift list
    # STEP5: Update the item_to_delete to take only the name
    item_to_delete = gift_list[index_to_delete][:name]
    gift_list.delete_at(index_to_delete)
    # STEP4: optionnal: tell the user it was successfully deleted
    puts "#{item_to_delete} was successfully deleted"
end

# STEP 5.5 : Refacto the mark_as_bought
def mark(gift_list)
    # STEP 5: Display the gift list
    list(gift_list)
    # STEP 5: Ask the user which item he bought (index)
    puts "What did you buy?"
    # STEP 5: Store his answer into a variable (integer)
    bought_item = gets.chomp.to_i - 1
    # STEP 5: Update the value in the gift list
    gift_list[bought_item][:bought] = true
    # STEP 5: Display the list to show the change
    list(gift_list)
end

def idea(gift_list)
    puts "What do you want to look for?"
    recherche = gets.chomp
    url = "https://www.etsy.com/search?q=#{recherche}"
    html = open(url).read
    doc = Nokogiri::HTML(html)
    results = []
    doc.search('.v2-listing-card__title').first(5).each do |element|
        results <<  element.text.strip
    end
    results.each_with_index do |result, index|
        p "#{index+1} #{result}"
    end
    puts "What do you want to add?"
    item_to_add = gets.chomp.to_i - 1
    gift_list << {name: results[item_to_add], bought: false}
end