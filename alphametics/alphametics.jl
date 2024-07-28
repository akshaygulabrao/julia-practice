using Combinatorics;

function str2number(dictionary, string)
    number = 0
    for s in string
        number*=10
        number+= dictionary[s]
    end
    return number
end

function tryCandidate(candidate,operands,result)
    numbers = []
    for operand in operands
        if candidate[operand[1]] == 0
            return false
        end
        push!(numbers,str2number(candidate,operand))
    end
    if sum(numbers) == str2number(candidate,result) && candidate[result[1]] != 0 
        return true
    end
    return false
    
end


function solve(str::String)
    letters = Set(c for c in str if isuppercase(c))
    components = split(str," ")[begin:2:end]
    operands = components[begin:end-1]
    result = components[end]
    for c in combinations(0:9,length(letters))
        for p in permutations(c)
            dictionary = Dict(zip(letters,p))
            if tryCandidate(dictionary,operands,result)
                return dictionary
            end
        end
    end
    return nothing
end