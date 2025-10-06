const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum {
    eggs,
    peanuts,
    shellfish,
    strawberries,
    tomatoes,
    chocolate,
    pollen,
    cats,
};

pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    const allergen_value: u8 = @as(u8, 1) << @intFromEnum(allergen);
    return (score & allergen_value) != 0;
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    var allergen_set = EnumSet(Allergen).initEmpty();
    const score_u8: u8 = @truncate(score);
    inline for (std.meta.fields(Allergen)) |field| {
        const allergen = @field(Allergen, field.name);
        if (isAllergicTo(score_u8, allergen)) {
            allergen_set.insert(allergen);
        }
    }
    return allergen_set;
}
