const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0) return true;

    var digit_count: u32 = 0;
    var temp = num;
    while (temp > 0) : (temp /= 10) {
        digit_count += 1;
    }

    var sum: u128 = 0;
    temp = num;
    while (temp > 0) : (temp /= 10) {
        const digit = temp % 10;
        sum += std.math.pow(u128, digit, digit_count);
        if (sum > num) return false;
    }

    return sum == num;
}

pub fn main() void {
    std.debug.print("0", .{isArmstrongNumber(100)});
}
