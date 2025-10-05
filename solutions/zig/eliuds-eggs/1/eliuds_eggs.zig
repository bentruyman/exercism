const std = @import("std");

pub fn eggCount(number: usize) usize {
    const allocator = std.heap.page_allocator;
    const binary_string = std.fmt.allocPrint(allocator, "{b}", .{number}) catch unreachable;
    defer allocator.free(binary_string);
    var count: usize = 0;

    for (binary_string) |char| {
        if (char == '1') count += 1;
    }

    return count;
}
