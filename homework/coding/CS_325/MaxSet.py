def max_independent_set(nums):
    num_len = len(nums)
    if num_len == 0:
        return []

    table = [0] * num_len
    choose = [False] * num_len

    table[0] = max(0,nums[0])
    choose[0] = nums[0] > 0

    for i in range(1,num_len):
        skip_sum = table[i-1]
        choose_sum = nums[i] + (table[i-2] if i >= 2 else 0)
        if choose_sum > skip_sum:
            table[i] = choose_sum
            choose[i] = True
        else:
            table[i] = skip_sum


    result = []
    i = num_len-1
    while i >= 0:
        if choose[i]:
            result.append(nums[i])
            i = i-2
        else:
            i -= 1  
    result.reverse()
    return result


