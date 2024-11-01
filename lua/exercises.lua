function change(amount)
  if math.type(amount) ~= "integer" then
    error("Amount must be an integer")
  end
  if amount < 0 then
    error("Amount cannot be negative")
  end
  local counts, remaining = {}, amount
  for _, denomination in ipairs({25, 10, 5, 1}) do
    counts[denomination] = remaining // denomination
    remaining = remaining % denomination
  end
  return counts
end

-- Write your first then lower case function here
function first_then_lower_case(strings, predicate)
  for idx = 0, #strings do
    if strings[idx] ~= nil and predicate(strings[idx]) then
      return string.lower(strings[idx])
    end
  end
  return nil
end

-- Write your powers generator here
function powers_generator(base, limit)
  return coroutine.create(function()
    local power = 1
    while power <= limit do
      coroutine.yield(power)
      power = power * base  
    end
  end)
end

-- Write your say function here
function say(text)
  --[[
  Say function concatenates string functions and chains together to create one final string phrase
  ]]--
  sentence = {}

  function final_sentence(next_text)
    if next_text == nil then 
      return table.concat(sentence, " ")
    else
      table.insert(sentence, next_text)
    end
    return final_sentence
  end
  if text == nil then
    return ""
  end

  table.insert(sentence, text)
  return final_sentence
end

-- Write your line count function here
function meaningful_line_count(filepath)
  linecount = 0
  file = io.open(filepath, "r")

  if file == nil then 
    error("No such file")
  end

  for line in file:lines() do
    line = line:match("^%s*(.-)%s*$")

    if (line ~= "" and not line:match("^#")) then
        linecount = linecount + 1
    end
  end

  file:close()
  return linecount
end

-- Write your Quaternion table here
Quaternion = (function (class)
  class.new = function (a, b, c, d)
    return setmetatable({a = a, b = b, c = c, d = d}, {
      __index = {
        coefficients = function(self)
          return {self.a, self.b, self.c, self.d}
        end,
        conjugate = function(self)
          return class.new(self.a, -self.b, -self.c, -self.d)
        end
      },
      __add = function(self, other_quat)
        return class.new(self.a + other_quat.a, self.b + other_quat.b, self.c + other_quat.c, self.d + other_quat.d)
      end,
      __sub = function(self, other_quat)
        return class.new(self.a - other_quat.a, self.b - other_quat.b, self.c - other_quat.c, self.d - other_quat.d)
      end,
      __mul = function(self, other_quat)
        -- learned how to multiply quaternions from Stack Overflow: https://stackoverflow.com/questions/19956555/how-to-multiply-two-quaternions
        return class.new(self.a * other_quat.a - self.b * other_quat.b - self.c * other_quat.c - self.d * other_quat.d,  -- 1
        self.a * other_quat.b + self.b * other_quat.a + self.c * other_quat.d - self.d * other_quat.c,  -- i
        self.a * other_quat.c - self.b * other_quat.d + self.c * other_quat.a + self.d * other_quat.b,  -- j
        self.a * other_quat.d + self.b * other_quat.c - self.c * other_quat.b + self.d * other_quat.a)  -- k 
      end,
      __eq = function(self, other_quat)
        return self.a == other_quat.a and self.b == other_quat.b and self.c == other_quat.c and self.d == other_quat.d
      end,
      __tostring = function(self)
        local quaternion_string = ""
        -- get formatted coefficient and remove 0, 1.0, or -1.0 so that either value doesn't show, just coefficient, or just negative coefficient
        function get_num_remove_digit(coefficient, basis_vector)
          coefficient_formatted = ""
          if coefficient > 1 and basis_vector ~= "" then
            coefficient_formatted = "+" .. tostring(coefficient)
          elseif coefficient == 1 and basis_vector ~= "" then
            coefficient_formatted = "+"
          elseif coefficient == -1 and basis_vector ~= "" then
            coefficient_formatted = "-"
          else
            -- number formatted is the number itself if number negative or if basis_vector == ""
            coefficient_formatted = tostring(coefficient)
          end
          if coefficient ~= 0 then
            return coefficient_formatted .. basis_vector
          end
          return ""
        end
        quaternion_string = quaternion_string .. get_num_remove_digit(self.a, "")
        quaternion_string = quaternion_string .. get_num_remove_digit(self.b, "i")
        quaternion_string = quaternion_string .. get_num_remove_digit(self.c, "j")
        quaternion_string = quaternion_string .. get_num_remove_digit(self.d, "k")
        -- learned how to remove trailing spaces from bentasker: https://snippets.bentasker.co.uk/page-1706031030-Trim-whitespace-from-string-LUA.html
        if quaternion_string ~= "" then
          quaternion_string = quaternion_string:gsub("^%+", "")
          return quaternion_string:match'^()%s*$' and '' or quaternion_string:match'^%s*(.*%S)'
        else
          return "0"
        end
      end
    })
    end
  return class
end)({})
