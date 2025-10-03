const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var fbs = std.io.fixedBufferStream(buffer);
    const w = fbs.writer();

    if (n % 3 == 0) w.writeAll("Pling") catch unreachable;
    if (n % 5 == 0) w.writeAll("Plang") catch unreachable;
    if (n % 7 == 0) w.writeAll("Plong") catch unreachable;
    if (fbs.pos == 0) w.print("{}", .{n}) catch {};

    return fbs.getWritten();
}
