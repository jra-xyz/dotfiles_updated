def dna_match_topdown(DNA1,DNA2):
    len_1 = len(DNA1)
    len_2 = len(DNA2)
    pair_length = {}

    def common_seq_len(i,j):
        if i == 0 or j == 0:
            return 0
        if (i,j) in pair_length:
            return pair_length[(i,j)]
        if DNA1[i-1] == DNA2[j-1]:
            pair_length[(i,j)] = common_seq_len(i-1,j-1) + 1

        else:
            pair_length[(i,j)] = max(common_seq_len(i-1,j),common_seq_len(i,j-1))

        return pair_length[(i,j)]


    return common_seq_len(len_1,len_2)


def dna_match_bottomup(DNA1,DNA2):
    len_1 = len(DNA1)
    len_2 = len(DNA2)

    table = [[0] * (len_2+1) for _ in range(len_1+1)]

    for i in range(1,len_1+1):
        for j in range(1,len_2+1):
            if DNA1[i-1] == DNA2[j-1]:
                table[i][j] = table[i-1][j-1] + 1 
            else:
                table[i][j] = max(table[i-1][j],table[i][j-1])
    return table[len_1][len_2]
