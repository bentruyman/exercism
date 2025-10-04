pub const Coordinate = struct {
    distance: f32,

    pub fn init(x: f32, y: f32) Coordinate {
        return Coordinate{ .distance = x * x + y * y };
    }
    pub fn score(self: Coordinate) usize {
        if (self.distance <= 1) return 10;
        if (self.distance <= 25) return 5;
        if (self.distance <= 100) return 1;
        return 0;
    }
};
