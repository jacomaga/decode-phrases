def mess_word(phrase, combinations)
    phrases = []
    phrase_form = count_phrase(phrase)

    while(combinations > 0 )
        new_phrase = []
        used_index = []
        for char in phrase_form
            char_used_times = char[1]
            while (char_used_times > 0)
                index = rand(0..(phrase.length - 1))
                if not used_index.include?(index)
                    new_phrase[index] = char[0] 
                    char_used_times -= 1
                    used_index.push(index)
                end
            end
        end

        if !phrases.include?(new_phrase.join(''))
            phrases.push(new_phrase.join(''))
            combinations -= 1
        end
    end

    return phrases
end 

def count_character(phrase, character)
    char_count = 0
    phrase.each_char{ |c|
        if c == character
            char_count += 1
        end
    }
    return char_count
end

def count_phrase(phrase)
    phrase_count = []
    
    phrase.each_char{|c|
        char_count = count_character(phrase, c)
        if !phrase_count.include?([c, char_count])
            phrase_count.push([c, char_count])
        end
    }

    return phrase_count
end

puts "Enter the word or phrase to mess up: "
word = gets.chomp
puts "Enter the number of combinations that you want to generate: "
combinations = gets.chomp.to_i

puts mess_word(word, combinations)
