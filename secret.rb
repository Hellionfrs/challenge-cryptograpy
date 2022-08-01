# [a...z A .... Z 0...9]
# For each character -> position in the alpha = position
# then move to the left as many times of his ASCII codee

DICT = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
DICT_HASH = {}

for i in 0...DICT.length
  DICT_HASH[DICT[i]] = i
end
p DICT_HASH 
  key_word = "art"

  def decode(encoded_msg, key_word)
    # p DICT_HASH
    coded_msg = []
    arr_pos = []
    current_pos = 0
    for i in 0...encoded_msg.length # loops in every char in the encoded_msg
      if encoded_msg[i] ==  " "
        coded_msg << " "
      elsif encoded_msg[i] ==  "!"  
        coded_msg << "!"
      elsif encoded_msg[i] ==  ","  
        coded_msg << ","
      elsif encoded_msg[i] ==  "."  
        coded_msg << "."
      elsif encoded_msg[i] ==  ";"  
        coded_msg << ";"
      else
        
        current_pos = DICT_HASH[encoded_msg[i]]
        arr_pos << current_pos
        if i == 0
          for j in 1.upto(total_moves(key_word))  # moves to the left the current position of the char of the encoded_msg
            current_pos = current_pos - 1
            # puts "esta es la posicion #{current_pos} que equivale a la letra = #{DICT_HASH.key(current_pos)}   y vamos en la iteracion #{j}"
            # si llegamos a = pos 0 la a debe saltar hasta 9 pos = 61 y seguir
            if j ==  total_moves(key_word)
              coded_msg << DICT_HASH.key(current_pos)
              
            end
            if current_pos == 0 && j != total_moves(key_word)
              current_pos = 62
            end
          end
          # p current_pos
          coded_msg
        else
          for j in 1.upto(total_moves(key_word) + (arr_pos[arr_pos.length - 2]))  # moves to the left the current position of the char of the encoded_msg
            encoded_msg[i].ord  #  (DICT_HASH[encoded_msg[i-1]])  
            # p current_pos
            current_pos = current_pos - 1
            # p DICT_HASH[encoded_msg[i-1]]
            # p "En el Else esta es la posicion #{current_pos} que equivale a la letra = #{DICT_HASH.key(current_pos)}   y vamos en la iteracion #{j}"
            # si llegamos a = pos 0 la a debe saltar hasta 9 pos = 61 y seguir
            if j ==  (total_moves(key_word) + (arr_pos[arr_pos.length- 2]))
              coded_msg << DICT_HASH.key(current_pos)
              
            end
            if current_pos == 0 && j != (total_moves(key_word) + (arr_pos[arr_pos.length- 2]))
              current_pos = 62
            end
          end
        end
      end
    end
    coded_msg.join("")
  end

  def total_moves(key_word)
    moves = []
    for i in 0...key_word.length
      moves << key_word[i].ord
    end
    moves.sum
  end
  
  p total_moves("art")
  p decode("6ULw9", "hello")
  p decode("A sw Z5e9 MSVQMQW5g", "Marvolo")
  p decode("wLSORUUMVZbl!", "Marvolo")
  p decode("sFxsk MIDvIRJ", "Marvolo")
  p decode("vBunD CuE JP TLV62b, wCvoE EO G DMIE ADA, sxs NTMFV UMW QW0W 7d nfso NFOXd KQ1c8h.", "Marvolo")