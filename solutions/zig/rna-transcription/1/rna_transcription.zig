const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var arr = try allocator.alloc(u8, dna.len);

    for (dna, 0..) |val, i| {
        arr[i] = switch (val) {
            'A' => 'U',
            'C' => 'G',
            'G' => 'C',
            'T' => 'A',
            else => unreachable,
        };
    }

    return arr;
}
