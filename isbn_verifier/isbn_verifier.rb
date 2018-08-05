class IsbnVerifier
  def self.valid?(isbn)
    isbn.gsub!(/-/, "")
    if (isbn.length == 10) then
      # correct length
      check = 0
      for i in 0..8
        # calculate checksum not including last digit
        check += isbn.slice(i).to_i * (10 - i)
      end
      if (isbn.slice(9) == "X" || isbn.slice(9) == "x") then
        # last digit is an x or X
        check += 10
      elsif !(isbn.slice(9) =~ (/[0-9]/))
        # last digit isn't a x or a number
        return false
      else 
        # last digit is a number
        check += isbn.slice(9).to_i
      end
      if (check % 11 == 0)
        return true
      else 
        return false
      end
    else 
      # not correct length
      return false
    end
  end

end