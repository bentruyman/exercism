pub fn squareRoot(radicand: usize) usize {
    var i: u16 = 1;
    while (true) : (i += 1) {
        if (i * i == radicand) return i;
    }
}
