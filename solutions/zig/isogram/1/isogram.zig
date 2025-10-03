pub fn isIsogram(str: []const u8) bool {
    var seen = [_]bool{false} ** 26;

    for (str) |char| {
        if (char == ' ' or char == '-') {
            continue;
        }

        const lower = if (char >= 'A' and char <= 'Z')
            char + 32
        else
            char;

        if (lower >= 'a' and lower <= 'z') {
            const index = lower - 'a';
            if (seen[index]) {
                return false;
            }
            seen[index] = true;
        }
    }

    return true;
}
