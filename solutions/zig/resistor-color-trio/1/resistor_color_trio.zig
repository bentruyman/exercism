const std = @import("std");
const mem = std.mem;

pub const ColorBand = enum(usize) { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {
    const zeros = @intFromEnum(colors[2]);
    var ohms = @intFromEnum(colors[0]) * 10 + @intFromEnum(colors[1]);

    ohms *= std.math.pow(usize, 10, zeros);

    if (ohms >= 1_000_000_000) {
        const value = @as(f64, @floatFromInt(ohms)) / 1_000_000_000.0;
        return std.fmt.allocPrint(allocator, "{d} gigaohms", .{value});
    } else if (ohms >= 1_000_000) {
        const value = @as(f64, @floatFromInt(ohms)) / 1_000_000.0;
        return std.fmt.allocPrint(allocator, "{d} megaohms", .{value});
    } else if (ohms >= 1_000) {
        const value = @as(f64, @floatFromInt(ohms)) / 1_000.0;
        return std.fmt.allocPrint(allocator, "{d} kiloohms", .{value});
    } else {
        return std.fmt.allocPrint(allocator, "{d} ohms", .{ohms});
    }
}
