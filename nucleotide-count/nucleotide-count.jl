"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)

    cntr = Dict([('A',0),('G',0),('T',0),('C',0)])
    for i in strand
        try
            cntr[i]+=1
        catch KeyError
            throw(DomainError("error"))
        end
    end
    return cntr
end
