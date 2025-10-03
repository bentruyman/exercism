pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    for (s, 0..) |_, i| {
        buffer[i] = s[s.len - i - 1];
    }
    return buffer[0..s.len];
}
