pub const ColorBand = enum(usize) { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn colorCode(color: ColorBand) usize {
    return @intFromEnum(color);
}

pub fn colors() []const ColorBand {
    return @import("std").enums.values(ColorBand);
}
