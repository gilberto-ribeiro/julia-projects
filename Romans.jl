roman_numerals = Dict(
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000)

function parse_roman(num_rm)
    num_rm = reverse(uppercase(num_rm))
    num_int = 0
    vals = [roman_numerals[ch] for ch in num_rm]
    for (i, val) in enumerate(vals)
        if i > 1 && val < vals[i-1]
            num_int -= val
        else
            num_int += val
        end
    end
    num_int
end

