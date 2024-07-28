using Combinatorics

function combinations_in_cage(target::Int64,num_digits::Int64)
    ans = []
    b = combinations(1:9,num_digits)
    for i in b
        if sum(i) == target
            push!(ans,i)
        end
    end
    return ans
    
end

function combinations_in_cage(sum::Int64,num_digits::Int64, restrictions)
    ans = combinations_in_cage(sum,num_digits)
    filtered_ans = []
    for i in ans
        if !(i[1] in restrictions || i[2] in restrictions)
            push!(filtered_ans,i)
        end
    end
    return filtered_ans
end
