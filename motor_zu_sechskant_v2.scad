use <sechskant.scad>;

d = 24.5;

module zylindersegment(a1, a2, r, h) {
	intersection() {
		cylinder(h=h, r=r);
		linear_extrude(height=3*h, center=true) polygon([
			[0, 0],
			[cos(a1) * r*2, sin(a1) * r*2],
			[cos(a2) * r*2, sin(a2) * r*2]
		]);
	}
}

union() {
difference() {
	union() {
		cylinder(h=6, r1=21/2, r2=d/2, $fn=200);
		translate([0,0,6]) cylinder(h=13-6, r=d/2, $fn=200);
	}
	translate([0,0,-1]) sechskant(sw = 17.4, h = 1+12);
	translate([0,0,-1]) cylinder(h=15, r=12/2, $fn=100);
}
translate([0,0,13]) for (i = [1:4:16]) {
	difference() {
		zylindersegment(a1 = 360/16 * (i-1), a2 = 360/16 * i, r=d/2, h=4, $fn=200);
		translate([0,0,-1]) cylinder(h=10, r=14/2, $fn=100);
	}
}
}


translate([30,0,0]) {
difference() {
	cylinder(h=6, r=d/2, $fn=200);
	translate([0,0,5.7]) mirror([0,0,1]) cylinder(h=10, r=5.1/2, $fn=100);
	translate([0,0,-0.1]) cylinder(h=1.5, r1=6/2, r2=5.1/2, $fn=100);
}
translate([0,0,6]) for (i = [1:4:16]) {
	difference() {
		zylindersegment(a1 = 360/16 * (i-1), a2 = 360/16 * i, r=d/2, h=4, $fn=200);
		translate([0,0,-1]) cylinder(h=10, r=14/2, $fn=100);
	}
}
}

alol=2; // 2 for positive print with makerbot, 0 seems fine for silicone form
!translate([60,0,0]){ difference() {
	//translate([-20, -20, -2.1]) cube([40, 40, 6]); // to make negative form
	union() {
	for (i = [1:2:16]) {
		zylindersegment(
			a1 = 360/16 * (i-1) + alol,
			a2 = 360/16 * i - alol,
			r=d/2, h=4, $fn=200);
	}
	cylinder(h=4, r=12/2, $fn=100);
	}
}
}
