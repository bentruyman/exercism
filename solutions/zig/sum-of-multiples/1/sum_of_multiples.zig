const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var seen = std.AutoHashMap(u32, void).init(allocator);
    defer seen.deinit();

    for (factors) |factor| {
        if (factor == 0) continue;

        var multiple = factor;
        while (multiple < limit) : (multiple += factor) {
            try seen.put(multiple, {});
        }
    }

    var total: u64 = 0;
    var it = seen.keyIterator();
    while (it.next()) |key| {
        total += key.*;
    }

    return total;
}
