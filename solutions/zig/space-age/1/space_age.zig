const std = @import("std");
const year = 60 * 60 * 24 * 365.25;

pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        const p: f64 = switch (self) {
            .mercury => 0.2408467,
            .venus => 0.61519726,
            .earth => 1.0,
            .mars => 1.8808158,
            .jupiter => 11.862615,
            .saturn => 29.447498,
            .uranus => 84.016846,
            .neptune => 164.79132,
        };

        return @as(f64, @floatFromInt(seconds)) / (p * year);
    }
};
