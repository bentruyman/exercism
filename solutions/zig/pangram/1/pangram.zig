pub fn isPangram(str: []const u8) bool {
    var count: [26]u8 = [_]u8{0} ** 26;

    for (str) |char| {
        if ((char < 'A' or char > 'Z') and (char < 'a' or char > 'z')) {
            continue;
        }

        const lower = lowerChar(char) - 'a';
        count[lower] += 1;
    }

    for (count) |char| {
        if (char == 0) {
            return false;
        }
    }

    return true;
}

fn lowerChar(char: u8) u8 {
    if (char >= 'A' and char <= 'Z') {
        return char + 32;
    }

    return char;
}
