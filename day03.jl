include("executor.jl")

function day03(lines)
    sum = 0
    cnt = 0

    for line in lines
        cnt += 1
        lastFound = 1
        numbers = [m.match for m in eachmatch(r"\d+", line)]

        for number in numbers
            range = findnext(number, line, lastFound)
            lastFound = range.stop

            hasLeftSymbol = range.start - 1 > 0 && line[range.start - 1] != '.'
            hasRightSymbol = range.stop + 1 < length(line) && line[range.stop + 1] != '.'

            rStart = range.start - 1 > 0 ? range.start - 1 : range.start
            rStop = range.stop + 1 < length(line) ? range.stop + 1 : range.stop
            hasAboveSymbol = cnt - 1 > 0 && occursin(r"[^\.]+", lines[cnt - 1][rStart:rStop])
            hasBelowSymbol = cnt + 1 < length(lines) && occursin(r"[^\.]+", lines[cnt + 1][rStart:rStop])

            if hasLeftSymbol || hasRightSymbol || hasAboveSymbol || hasBelowSymbol
                sum += parse(Int, number)
            end
        end
    end

    return sum
end

execute(3, day03)