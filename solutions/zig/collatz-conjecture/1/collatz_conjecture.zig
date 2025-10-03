pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    if (number == 0) return ComputationError.IllegalArgument;

    var temp = number;
    var count: usize = 0;

    while (temp > 1) : (count += 1) {
        if (temp % 2 == 0) {
            temp /= 2;
        } else {
            temp = temp * 3 + 1;
        }
    }

    return count;
}
