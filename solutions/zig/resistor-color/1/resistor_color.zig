const std = @import("std");

pub const ColorBand = enum(usize) { black, brown, red, orange, yellow, green, blue, violet, grey, white };

const bands = [_]ColorBand{
    .black, .brown, .red,    .orange, .yellow,
    .green, .blue,  .violet, .grey,   .white,
};

pub fn colorCode(color: ColorBand) usize {
    for (bands, 0..) |band, i| {
        if (band == color) return i;
    }
    unreachable;
}

pub fn colors() []const ColorBand {
    return &bands;
}
