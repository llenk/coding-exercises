class Brackets
  def self.paired?(bracket_set)
    s_brackets = /[\{\[\(]/
    e_brackets = /[}\]\)]/
    current_brackets = []
    if bracket_set.length > 0 
      for i in 0...bracket_set.length
        if (bracket_set.slice(i) =~ s_brackets) 
          current_brackets.push(bracket_set.slice(i))
        elsif (bracket_set.slice(i) =~ e_brackets)
          if current_brackets.length == 0
            return false
          elsif self.matching_bracket?(current_brackets[-1], bracket_set.slice(i))
            current_brackets.pop
          else 
            return false
          end
        end
      end
      if current_brackets.length == 0
        return true
      else 
        return false
      end
    else 
      return true
    end
  end

  def self.matching_bracket?(bracket_one, bracket_two)
    # the first argument has to be the first bracket (ie {, not })
    if bracket_one == "{" && bracket_two == "}"
      return true
    elsif bracket_one == "[" && bracket_two == "]"
      return true
    elsif bracket_one == "(" && bracket_two == ")"
      return true
    else
      return false
    end
  end

  if self.paired?('{[)][]}')
    print 'eyy'
  else 
    print 'nayy'
  end
end