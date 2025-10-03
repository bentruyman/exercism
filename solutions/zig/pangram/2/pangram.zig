const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var letters = std.bit_set.IntegerBitSet(26).initEmpty();
    for (str) |char| {
        if (!std.ascii.isAlphabetic(char)) continue;
        letters.set(std.ascii.toLower(char) - 'a');
    }
    return letters.count() == 26;
}
