include("executor.jl")

function day03_2(lines)
    sum = 0
    cnt = 0

    for line in lines
        cnt += 1
        lastFound = 1

        # find numbers above
        rNumbersAbove = cnt > 1 ? findall(r"\d+", lines[cnt - 1]) : []
        rNumbersAbove = [r.start - 1 : r.stop + 1 for r in rNumbersAbove]

        # find numbers below
        rNumbersBelow = cnt < length(lines) ? findall(r"\d+", lines[cnt + 1]) : []
        rNumbersBelow = [r.start - 1 : r.stop + 1 for r in rNumbersBelow]

        # find numbers same line
        rNumbersSameLine = findall(r"\d+", lines[cnt])

        # find symbols
        symbols = [m.match for m in eachmatch(r"[\*]+", line)]
        for symbol in symbols
            rSymbol = findnext(symbol, line, lastFound).start
            lastFound = rSymbol + 1
            gearNumbers = []

            for rNumber in rNumbersAbove
                if rSymbol in rNumber && cnt > 0
                    rNumber = rNumber.start + 1 : rNumber.stop - 1
                    push!(gearNumbers, parse(Int, lines[cnt - 1][rNumber]))
                end
            end

            for rNumber in rNumbersBelow
                if rSymbol in rNumber && cnt < length(lines)
                    rNumber = rNumber.start + 1 : rNumber.stop - 1
                    push!(gearNumbers, parse(Int, lines[cnt + 1][rNumber]))
                end
            end

            for rNumber in rNumbersSameLine
                if rSymbol - rNumber.stop == 1 || rNumber.start - rSymbol == 1
                    push!(gearNumbers, parse(Int, line[rNumber]))
                end
            end

            if length(gearNumbers) == 2
                sum += gearNumbers[1] * gearNumbers[2]
            end
        end            
    end

    return sum
end

execute(3, day03_2)