const pow = @import("std").math.pow;

pub const Coordinate = struct {
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{ .x = x_coord, .y = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        const distance = pow(f32, self.x, 2) + pow(f32, self.y, 2);
        if (distance <= 1) {
            return 10;
        } else if (distance <= 25) {
            return 5;
        } else if (distance <= 100) {
            return 1;
        } else {
            return 0;
        }
    }
};
