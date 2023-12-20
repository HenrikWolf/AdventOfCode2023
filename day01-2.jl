include("executor.jl")

digitStrings = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

function day01_2(lines)
    sum = 0

    for line in lines
        digit = 0
        firstDigitIndex = length(line)
        lastDigitIndex = 0
        firstDigit = ""
        lastDigit = ""

        for digitString in digitStrings
            digit += 1

            digitRange = findfirst(digitString, line)
            if !isnothing(digitRange)
                if digitRange.start <= firstDigitIndex
                    firstDigitIndex = digitRange.start
                    firstDigit = string(digit)
                end
            end

            digitRange = findfirst(string(digit), line)
            if !isnothing(digitRange)
                if digitRange.start <= firstDigitIndex
                    firstDigitIndex = digitRange.start
                    firstDigit = string(digit)
                end
            end

            digitRange = findlast(digitString, line)
            if !isnothing(digitRange)
                if digitRange.stop >= lastDigitIndex
                    lastDigitIndex = digitRange.stop
                    lastDigit = string(digit)
                end
            end

            digitRange = findlast(string(digit), line)
            if !isnothing(digitRange)
                if digitRange.stop >= lastDigitIndex
                    lastDigitIndex = digitRange.stop
                    lastDigit = string(digit)
                end
            end
        end
    
        edges = firstDigit * lastDigit
        sum += parse(Int, edges)
    end

    return sum
end

execute(1, day01_2)