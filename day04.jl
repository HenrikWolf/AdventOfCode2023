include("executor.jl")

function day04(lines)
    sum = 0

    for line in lines
        card = split(line, (':', '|'))
        winNumbers = split(card[2], ' ')
        myNumbers = split(card[3], ' ')
        myWinNumbers = filter(x -> !isempty(x), intersect(winNumbers, myNumbers))

        if length(myWinNumbers) < 2
            sum += length(myWinNumbers)
        else
            sum += 2^(length(myWinNumbers) - 1)
        end
    end

    return sum
end

execute(4, day04)