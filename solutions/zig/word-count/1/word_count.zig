const std = @import("std");
const mem = std.mem;

pub fn countWords(allocator: mem.Allocator, s: []const u8) !std.StringHashMap(u32) {
    var counts = std.StringHashMap(u32).init(allocator);
    errdefer {
        var iter = counts.keyIterator();
        while (iter.next()) |key_ptr| {
            allocator.free(key_ptr.*);
        }
        counts.deinit();
    }

    var i: usize = 0;
    while (i < s.len) {
        while (i < s.len and !isWordChar(s[i])) : (i += 1) {}
        if (i >= s.len) break;

        const start = i;
        while (i < s.len and isWordChar(s[i])) : (i += 1) {}

        var word = s[start..i];

        while (word.len > 0 and word[0] == '\'') {
            word = word[1..];
        }
        while (word.len > 0 and word[word.len - 1] == '\'') {
            word = word[0 .. word.len - 1];
        }

        if (word.len == 0) continue;

        const lower = try allocator.alloc(u8, word.len);
        errdefer allocator.free(lower);
        for (word, 0..) |c, j| {
            lower[j] = std.ascii.toLower(c);
        }

        const result = try counts.getOrPut(lower);
        if (!result.found_existing) {
            result.key_ptr.* = lower;
            result.value_ptr.* = 1;
        } else {
            allocator.free(lower);
            result.value_ptr.* += 1;
        }
    }

    return counts;
}

fn isWordChar(c: u8) bool {
    return std.ascii.isAlphanumeric(c) or c == '\'';
}
