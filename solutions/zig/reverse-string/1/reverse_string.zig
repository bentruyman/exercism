const std = @import("std");

pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    var fbs = std.io.fixedBufferStream(buffer);
    const w = fbs.writer();

    for (s, 0..) |_, index| {
        w.writeByte(s[s.len - index - 1]) catch unreachable;
    }

    return fbs.getWritten();
}
