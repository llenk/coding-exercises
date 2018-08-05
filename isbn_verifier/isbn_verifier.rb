class IsbnVerifier
  def self.valid?(isbn)
    isbn.gsub!(/-/, "")
    if (isbn.length == 10) then
      # correct length
      check = isbn.slice(0).to_i * 10 + isbn.slice(1).to_i * 9 + isbn.slice(2).to_i * 8 + isbn.slice(3).to_i * 7 + isbn.slice(4).to_i * 6 + isbn.slice(5).to_i * 5 + isbn.slice(6).to_i * 4 + isbn.slice(7).to_i * 3 + isbn.slice(8).to_i * 2
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

  self.valid?("359821507X")
end