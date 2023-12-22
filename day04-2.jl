include("executor.jl")

function day04(lines)
    cards = []
    cnt = 0

    for line in lines
        card = split(line, (':', '|'))
        winNumbers = split(card[2], ' ')
        myNumbers = split(card[3], ' ')
        myWinNumbers = filter(x -> !isempty(x), intersect(winNumbers, myNumbers))
        push!(cards, [length(myWinNumbers)])
    end

    println(cards)

    while length(cards) > 0
        for i in 2:cards[1][1] + 1
            push!(cards[i], cards[i][1])
        end
        popfirst!(length(cards[1]) == 1 ? cards : cards[1])
        cnt += 1
        println(cnt)
    end
    
    return cnt
end

execute(4, day04)