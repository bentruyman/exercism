const std = @import("std");

pub fn response(s: []const u8) []const u8 {
    const trimmed = std.mem.trim(u8, s, &std.ascii.whitespace);

    if (trimmed.len == 0) {
        return "Fine. Be that way!";
    }

    const is_question = trimmed[trimmed.len - 1] == '?';
    const is_yelling = isYelling(trimmed);

    if (is_yelling and is_question) {
        return "Calm down, I know what I'm doing!";
    } else if (is_yelling) {
        return "Whoa, chill out!";
    } else if (is_question) {
        return "Sure.";
    } else {
        return "Whatever.";
    }
}

fn isYelling(s: []const u8) bool {
    var has_letter = false;
    for (s) |c| {
        if (std.ascii.isAlphabetic(c)) {
            has_letter = true;
            if (std.ascii.isLower(c)) {
                return false;
            }
        }
    }
    return has_letter;
}
