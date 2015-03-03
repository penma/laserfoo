difference() {
	union() {
		translate([0,0,3/2]) cube([70, 42, 3], true);
		translate([0,0,13/2]) cube([42, 42, 13], true);
	}
	for (x = [+57/2, -57/2]) {
		for (y = [ -25/2, +25/2]) {
			translate([x, y, 0]) cylinder(h=100, r=5.7/2, $fn=50, center=true);
		}
	}

	cylinder(h=100, center=true, r=25/2, $fn=100);
	for (x = [-1, +1]) {
	for (y = [-1, +1]) {
		translate([x * 31/2, y * 31/2, 0]) cylinder(h=100, r=4.3/2, $fn=50, center=true);
	}
	}	
}

difference() {
rotate(90, [1,0,0]) linear_extrude(height=42, center=true) {
polygon([
	[-42/2, 3], [-42/2 - 10, 3], [-42/2, 3+10]
]);
polygon([
	[42/2, 3], [42/2 + 10, 3], [42/2, 3+10]
]);
};
for (x = [+57/2, -57/2]) {
	for (y = [ -25/2, +25/2]) {
		translate([x, y, 0]) cylinder(h=100, r=11/2, $fn=50, center=true);
	}
}
}
