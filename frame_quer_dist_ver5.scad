stab_d = 11.7;
blockh = 23;

module klemmteil() {
	translate([0,0,-blockh/4]) difference() {
		cube([23, 25, blockh/2], true);
		translate([0,0, blockh/4]) cube([100, stab_d, stab_d], true);
		cylinder(h=100, r=5.7/2, $fn=50, center=true);
	}
}

difference() {
	union() {
		translate([0, -50/2, 0]) klemmteil();
		translate([0, +50/2, 0]) klemmteil();
		translate([0,0,-blockh/4]) cube([23, 25, blockh/2], true);
	}
	cube([stab_d, stab_d, 100], true);
	rotate(90, [0,1,0]) cylinder(h=100, center=true, r=5.7/2, $fn=50);
}
