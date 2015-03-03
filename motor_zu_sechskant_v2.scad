use <sechskant.scad>;

d = 24.5;

union() {
difference() {
	union() {
		cylinder(h=6, r1=21/2, r2=d/2, $fn=200);
		translate([0,0,6]) cylinder(h=13-6, r=d/2, $fn=200);
	}
	translate([0,0,-1]) sechskant(d_flaeche = 17.4, h = 1+12);
	translate([0,0,-1]) cylinder(h=15, r=12/2, $fn=100);
}
translate([0,0,13]) for (i = [1:4:16]) {
	difference() {
		intersection() {
			cylinder(h=4, r=d/2, $fn=200);
			linear_extrude(height=4) polygon([
				[0, 0],
				[cos(360/16 * i) * 100, sin(360/16 * i) * 100],
				[cos(360/16 * (i-1)) * 100, sin(360/16 * (i-1)) * 100]
			]);
		}
		translate([0,0,-1]) cylinder(h=10, r=14/2, $fn=100);
	}
}
*difference() {
	cylinder(h=13, r1=9/2, r2=12.5/2, $fn=50);
	translate([0,0,-1]) cylinder(h=20, r1=7.5/2, r2=11/2, $fn=50);
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
		intersection() {
			cylinder(h=4, r=d/2, $fn=200);
			linear_extrude(height=4) polygon([
				[0, 0],
				[cos(360/16 * i) * 100, sin(360/16 * i) * 100],
				[cos(360/16 * (i-1)) * 100, sin(360/16 * (i-1)) * 100]
			]);
		}
		translate([0,0,-1]) cylinder(h=10, r=14/2, $fn=100);
	}
}
}

alol=2; // 2 for positive print with makerbot, 0 seems fine for silicone form
!translate([60,0,0]){ difference() {
	//translate([-20, -20, -2.1]) cube([40, 40, 6]); // to make negative form
	union() {
	for (i = [1:2:16]) {
		intersection() {
			cylinder(h=4, r=d/2, $fn=200);
			linear_extrude(height=4) polygon([
				[0, 0],
				[cos(360/16 * i - alol) * 100, sin(360/16 * i - alol) * 100],
				[cos(360/16 * (i-1) + alol) * 100, sin(360/16 * (i-1) + alol) * 100]
			]);
		}
	}
	cylinder(h=4, r=12/2, $fn=100);
	}
}
}