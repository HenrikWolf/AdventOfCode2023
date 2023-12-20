using DataStructures

include("executor.jl")

function day02_2(lines)
    sum = 0

    for line in lines
        cubeSetsString = split(line, ":")[2]
        cubeSets = split(cubeSetsString, ";")
        minSet = [0 0 0]

        for revealedCubesString in cubeSets
            revealedCubes = split(revealedCubesString, ",")

            for cubesString in revealedCubes
                cubes = split(strip(cubesString), " ")
                cnt = parse(Int, cubes[1])

                minSet[1] = cubes[2] == "red" ? max(minSet[1], cnt) : minSet[1]
                minSet[2] = cubes[2] == "green" ? max(minSet[2], cnt) : minSet[2]
                minSet[3] = cubes[2] == "blue" ? max(minSet[3], cnt) : minSet[3]
            end
        end

        sum += prod(minSet)
    end

    return sum
end

execute(2, day02_2)