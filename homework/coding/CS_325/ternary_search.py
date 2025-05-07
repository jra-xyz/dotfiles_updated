def ternary_search(input_list, target):

    lower, upper = 0, len(input_list) - 1

    while lower <= upper:
        # split into 3 equal parts
        third = (upper - lower) // 3
        sep1 = lower + third
        sep2 = upper - third

        if input_list[sep1] == target:
            return sep1 + 1
        if input_list[sep2] == target:
            return sep2 + 1

        # calculating which third the target value is contained in, if it is contained at all
        if target < input_list[sep1]:
            upper = sep1 - 1
        elif target > input_list[sep2]:
            lower = sep2 + 1
        else:
            lower = sep1 + 1
            upper = sep2 - 1
    # returns none if target is not in list
    return None
