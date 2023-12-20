using DataStructures

include("executor.jl")

function day02(lines)
    game = 0
    cnt = 0

    for line in lines
        game += 1
        cubeSetsString = split(line, ":")[2]
        cubeSets = split(cubeSetsString, ";")
        tooManyCubes = false

        for revealedCubesString in cubeSets
            revealedCubes = split(revealedCubesString, ",")

            for cubesString in revealedCubes
                cubes = split(strip(cubesString), " ")
                hasTooManyRed = cubes[2] == "red" && parse(Int, cubes[1]) > 12
                hasTooManyGreen = cubes[2] == "green" && parse(Int, cubes[1]) > 13
                hasTooManyBlue = cubes[2] == "blue" && parse(Int, cubes[1]) > 14
                if hasTooManyRed || hasTooManyGreen || hasTooManyBlue
                    tooManyCubes = true
                end
            end
        end

        if !tooManyCubes
            cnt += game
        end
    end

    return cnt
end

execute(2, day02)