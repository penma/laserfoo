use <sechskant.scad>;


stab_d = 11.7;
blockh = 23;

module klemmteil() {
	translate([0,0,-blockh/4]) difference() {
		cube([70, 25, blockh/2], true);
		translate([0,0, blockh/4]) cube([100, stab_d, stab_d], true);
	}
}

difference() {
	union() {
		translate([0, -50/2, 0]) klemmteil();
		translate([0, +50/2, 0]) klemmteil();
		translate([0,0,-blockh/4]) cube([70, 25, blockh/2], true);
		// translate([0, +50/2 + 25/2 + 10/2, -blockh/4]) cube([50, 10, blockh/2], true);
		//translate([0, -50/2 - 25/2 - 10/2, -blockh/4]) cube([50, 10, blockh/2], true);
	}
	cylinder(h=100, r=26.5/2, $fn=100, center=true);
	cylinder(h=9, r=30.4/2, $fn=100, center=true);
	for (x = [-17.5, +17.5, +57/2, -57/2]) {
		for (y = [/* 50/2 + 25/2 + 2, -50/2 - 25/2 - 2,*/  -25/2, +25/2]) {
			translate([x, y, 0]) cylinder(h=100, r=5.7/2, $fn=50, center=true);
		}
	}

	// XXX: für Testfoo eine Mutter versenkbar
	for (x = [+57/2, -57/2]) {
		for (y = [-25/2, +25/2]) {
			translate([x, y, -4.5]) sechskant(sw = 8.5, h = 10);
		}
	}

	// XXX: Stepper
	% union() {
	cylinder(h=100, center=true, r=25/2, $fn=50);
	for (x = [-1, +1]) {
	for (y = [-1, +1]) {
		translate([x * 31/2, y * 31/2, 0]) cylinder(h=100, r=4.3/2, $fn=20, center=true);
	}
	}
	cube([45, 45, 100], true);
	}
}
