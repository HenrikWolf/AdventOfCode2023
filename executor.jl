
# @time logs the execution time
function execute(day, calculation)
    open("datasheet-$day.txt") do file
        result = @time calculation(readlines(file))
        println("Result: $result")
    end
end