use <sechskant.scad>;

d = 24.5;
d_welle = 5.1;

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

module kupplungsstern(n_seg, inc_seg, d_aussen, d_innen, h, a_extra=0) {
	for (i = [1:inc_seg:n_seg]) {
		difference() {
			zylindersegment(
				a1 = 360/n_seg * (i-1) + a_extra,
				a2 = 360/n_seg *  i    - a_extra,
				r=d_aussen/2, h=h);
			translate([0,0,-1]) cylinder(h=h+2, r=d_innen/2);
		}
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
translate([0,0,13]) kupplungsstern(n_seg=16, inc_seg=4, d_aussen=d, d_innen=14, h=4, a_extra=0, $fn=200);
}


translate([30,0,0]) {
difference() {
	cylinder(h=6, r=d/2, $fn=200);
	translate([0,0,5.7]) mirror([0,0,1]) cylinder(h=10, r=5.1/2, $fn=100);
	translate([0,0,-0.1]) cylinder(h=1.5, r1=d_welle/2 + 0.5, r2=d_welle/2, $fn=100);
}
translate([0,0,6]) kupplungsstern(n_seg=16, inc_seg=4, d_aussen=d, d_innen=14, h=4, a_extra=0, $fn=200);
}

alol=2; // 2 for positive print with makerbot, 0 seems fine for silicone form
!translate([60,0,0]){ difference() {
	//translate([-20, -20, -2.1]) cube([40, 40, 6]); // to make negative form
	union() {
		kupplungsstern(n_seg=16, inc_seg=2, d_aussen=d, h=4, a_extra=alol, $fn=200);
		cylinder(h=4, r=12/2, $fn=200);
	}
}
}
