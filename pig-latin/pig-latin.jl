function translate(phrase)
	println()
	words = split(phrase, " " )
	for i in eachindex(words)
		@show first_vowel = findfirst(r"^([aeiou]|xr|yt)", words[i])
		@show consonant_cluster_qu = findfirst(r"^[^aeiou]*qu",words[i])
		@show consonant_cluster = findfirst(r"^[^aeiouy]+",words[i])
		@show consonant_cluster_y = findfirst(r"[^aeiou]*y",words[i])
		if !isnothing(first_vowel)
			@show words[i] *= "ay"
		elseif !isnothing(consonant_cluster_qu)
			@show words[i] = words[i][consonant_cluster_qu.stop+1:end] * words[i][consonant_cluster_qu] * "ay"
		elseif !isnothing(consonant_cluster)
			@show words[i] = words[i][consonant_cluster.stop+1:end] * words[i][consonant_cluster]*"ay"
		elseif !isnothing(consonant_cluster_y)
			@show words[i] = words[i][consonant_cluster_y.stop+1:end] * words[i][begin:consonant_cluster_y.stop] *"ay"

		end

	end
	return join(words, " ")
end
