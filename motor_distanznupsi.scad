difference() {
	cube([35, 10, 25], true);
	translate([-25/2, 0, 0]) cylinder(h=100, r=5.7/2, $fn=50, center=true);
	translate([+25/2, 0, 0]) cylinder(h=100, r=5.7/2, $fn=50, center=true);
}
