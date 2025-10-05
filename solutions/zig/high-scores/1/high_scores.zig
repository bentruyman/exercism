const std = @import("std");

pub const HighScores = struct {
    scores: []const i32,
    sorted: [100]i32,
    top_count: usize,

    pub fn init(scores: []const i32) HighScores {
        var result = HighScores{
            .scores = scores,
            .sorted = undefined,
            .top_count = scores.len,
        };

        @memcpy(result.sorted[0..scores.len], scores);
        std.mem.sort(i32, result.sorted[0..scores.len], {}, std.sort.desc(i32));

        return result;
    }

    pub fn latest(self: *const HighScores) ?i32 {
        if (self.scores.len == 0) return null;
        return self.scores[self.scores.len - 1];
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        if (self.top_count == 0) return null;
        return self.sorted[0];
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        const count = @min(3, self.top_count);
        return self.sorted[0..count];
    }
};
