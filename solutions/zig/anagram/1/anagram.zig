const std = @import("std");
const mem = std.mem;

pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var set = std.BufSet.init(allocator);
    errdefer set.deinit();

    const lowered_word = try std.ascii.allocLowerString(allocator, word);
    defer allocator.free(lowered_word);
    const sorted_word = try sort(allocator, word);
    defer allocator.free(sorted_word);

    for (candidates) |candidate| {
        const lowered_candidate = try std.ascii.allocLowerString(allocator, candidate);
        defer allocator.free(lowered_candidate);
        if (std.mem.eql(u8, lowered_word, lowered_candidate)) continue;

        const sorted_candidate = try sort(allocator, candidate);
        defer allocator.free(sorted_candidate);
        if (std.mem.eql(u8, sorted_word, sorted_candidate)) {
            try set.insert(candidate);
        }
    }

    return set;
}

fn sort(allocator: mem.Allocator, word: []const u8) error{OutOfMemory}![]u8 {
    const lowered = try std.ascii.allocLowerString(allocator, word);
    std.mem.sort(u8, lowered, {}, std.sort.asc(u8));
    return lowered;
}
