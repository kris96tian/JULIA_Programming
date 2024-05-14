function translate_dna_to_protein(dna_sequence)
    genetic_code = Dict(
        "TTT" => ('F', "Phenylalanine"), "TTC" => ('F', "Phenylalanine"), 
        "TTA" => ('L', "Leucine"), "TTG" => ('L', "Leucine"),
        "TCT" => ('S', "Serine"), "TCC" => ('S', "Serine"), "TCA" => ('S', "Serine"), "TCG" => ('S', "Serine"),
        "TAT" => ('Y', "Tyrosine"), "TAC" => ('Y', "Tyrosine"), 
        "TGT" => ('C', "Cysteine"), "TGC" => ('C', "Cysteine"),  "TGG" => ('W', "Tryptophan"),
        "CTT" => ('L', "Leucine"), "CTC" => ('L', "Leucine"), "CTA" => ('L', "Leucine"), "CTG" => ('L', "Leucine"),
        "CCT" => ('P', "Proline"), "CCC" => ('P', "Proline"), "CCA" => ('P', "Proline"), "CCG" => ('P', "Proline"),
        "CAT" => ('H', "Histidine"), "CAC" => ('H', "Histidine"), 
        "CAA" => ('Q', "Glutamine"), "CAG" => ('Q', "Glutamine"),
        "CGT" => ('R', "Arginine"), "CGC" => ('R', "Arginine"), "CGA" => ('R', "Arginine"), "CGG" => ('R', "Arginine"),
        "ATT" => ('I', "Isoleucine"), "ATC" => ('I', "Isoleucine"), "ATA" => ('I', "Isoleucine"), 
        "ATG" => ('M', "Methionine"),
        "ACT" => ('T', "Threonine"), "ACC" => ('T', "Threonine"), "ACA" => ('T', "Threonine"), "ACG" => ('T', "Threonine"),
        "AAT" => ('N', "Asparagine"), "AAC" => ('N', "Asparagine"), 
        "AAA" => ('K', "Lysine"), "AAG" => ('K', "Lysine"),
        "AGT" => ('S', "Serine"), "AGC" => ('S', "Serine"), 
        "AGA" => ('R', "Arginine"), "AGG" => ('R', "Arginine"),
        "GTT" => ('V', "Valine"), "GTC" => ('V', "Valine"), "GTA" => ('V', "Valine"), "GTG" => ('V', "Valine"),
        "GCT" => ('A', "Alanine"), "GCC" => ('A', "Alanine"), "GCA" => ('A', "Alanine"), "GCG" => ('A', "Alanine"),
        "GAT" => ('D', "Aspartic Acid"), "GAC" => ('D', "Aspartic Acid"), 
        "GAA" => ('E', "Glutamic Acid"), "GAG" => ('E', "Glutamic Acid"),
        "GGT" => ('G', "Glycine"), "GGC" => ('G', "Glycine"), "GGA" => ('G', "Glycine"), "GGG" => ('G', "Glycine"),
        "TAA" => ('*', "Stop"), "TAG" => ('*', "Stop"), "TGA" => ('*', "Stop")
    )

    protein_sequence = ""
    amino_acid_sequence = ""

    for i in 1:3:length(dna_sequence)
        codon = dna_sequence[i:min(i+2, end)]
        if haskey(genetic_code, codon)
            amino_acid, aa_name = genetic_code[codon]
            protein_sequence *= amino_acid
            amino_acid_sequence *= aa_name * "-"
        else
            amino_acid_sequence *= "STOP" * "-"
        end
    end

    amino_acid_sequence = chop(amino_acid_sequence)  # remove the last hyphen

    return protein_sequence, amino_acid_sequence
end

# Example usage
println("Enter DNA sequence in UPPERCASE:")
dna_sequence = readline()
protein_sequence, amino_acid_sequence = translate_dna_to_protein(dna_sequence)
println("Protein Sequence: ", protein_sequence)
println("Amino Acid Sequence: ", amino_acid_sequence)