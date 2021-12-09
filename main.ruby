def mess_word(phrase, combinations)
    phrases = []

    while(combinations > 0 )
        new_phrase = []
        phrase.each_char.with_index{ |c, index|
            new_phrase[index] = phrase[rand(0..(phrase.length - 1))]
        }        
        
        if !phrases.include?(new_phrase.join(''))
            phrases.push(new_phrase.join(''))
            combinations -= 1
        end
    end

    return phrases
end 

puts mess_word('bala', 3)

