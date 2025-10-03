const std = @import("std");
const mem = std.mem;
const ArrayList = std.ArrayList;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var list = ArrayList(u8){};

    var next = true;

    for (words) |char| {
        if (std.ascii.isAlphabetic(char)) {
            if (next) {
                try list.append(allocator, std.ascii.toUpper(char));
                next = false;
            }
        } else {
            if (char != '\'') next = true;
        }
    }

    return list.toOwnedSlice(allocator);
}
