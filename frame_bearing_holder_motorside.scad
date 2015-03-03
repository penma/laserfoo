stab_d = 11.7;
blockh = 23;

module klemmteil() {
	translate([0,0,-blockh/4]) difference() {
		cube([50, 25, blockh/2], true);
		translate([0,0, blockh/4]) cube([100, stab_d, stab_d], true);
	}
}

difference() {
	union() {
		translate([0, -50/2, 0]) klemmteil();
		translate([0, +50/2, 0]) klemmteil();
		translate([0,0,-blockh/4]) cube([50, 25, blockh/2], true);
		// translate([0, +50/2 + 25/2 + 10/2, -blockh/4]) cube([50, 10, blockh/2], true);
		//translate([0, -50/2 - 25/2 - 10/2, -blockh/4]) cube([50, 10, blockh/2], true);
	}
	cylinder(h=100, r=26.5/2, $fn=100, center=true);
	cylinder(h=9, r=30.4/2, $fn=100, center=true);
	for (x = [-17.5, +17.5]) {
		for (y = [/* 50/2 + 25/2 + 2, -50/2 - 25/2 - 2,*/  -25/2, +25/2]) {
			translate([x, y, 0]) cylinder(h=100, r=5.7/2, $fn=50, center=true);
		}
	}
}
