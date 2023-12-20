include("executor.jl")

function day01(lines)
    cnt = 0

    for line in lines
        digits = filter(isdigit, line)
        edges = first(digits) * last(digits)
        cnt += parse(Int, edges)
    end

    return cnt
end

execute(1, day01)