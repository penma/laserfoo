use <sechskant.scad>;

d = 24.5;
d_welle = 5.1;
sw_mutter = 17.4;
d2_mutter = 21;

h_kupplung=4; /* Höhe der Klauen der beiden äußeren Teile */
h_zwischen=4; /* Höhe des Zwischenstücks */
h_mutter=8;  /* Der in der Kupplung versenkte Teil der Mutter */
h2_mutter=4;  /* Länge der Abschrägung */
h_uebermutter=1; /* Stärke zwischen Mutter und Klauen */
h_motor=6;    /* Das auf der Welle steckende Stück */
h_uebermotor=1; /* Stärke zwischen Welle und Klauen */

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

module kupplung_mutter() {
	difference() {
		union() {
			cylinder(h=h2_mutter, r1=d2_mutter/2, r2=d/2, $fn=200);
			translate([0,0,h2_mutter]) cylinder(h=h_mutter+h_uebermutter-h2_mutter, r=d/2, $fn=200);
		}
		translate([0,0,-1]) sechskant(sw = sw_mutter, h = h_mutter+1);
		translate([0,0,-1]) cylinder(h=h_mutter+h_uebermutter+2, r=12/2, $fn=100);
	}
	translate([0,0,h_mutter+h_uebermutter]) kupplungsstern(n_seg=16, inc_seg=4, d_aussen=d, d_innen=14, h=h_kupplung, a_extra=0, $fn=200);
}

module kupplung_motor() {
	difference() {
		cylinder(h=h_motor+h_uebermotor, r=d/2, $fn=200);
		translate([0,0,h_motor]) mirror([0,0,1]) cylinder(h=h_motor, r=d_welle/2, $fn=100);
		translate([0,0,-0.1]) cylinder(h=1.5, r1=d_welle/2 + 0.5, r2=d_welle/2, $fn=100);
	}
	translate([0,0,h_motor+h_uebermotor]) kupplungsstern(n_seg=16, inc_seg=4, d_aussen=d, d_innen=14, h=h_kupplung, a_extra=0, $fn=200);
}

module kupplung_mitte(alol=2) {
	/* alol=2 funktioniert ganz gut für ein Positiv mit dem Makerbot.
	 * für eine Silikonform 0, sonst wirds zu klein
	 */
	kupplungsstern(n_seg=16, inc_seg=2, d_aussen=d, h=h_zwischen, a_extra=alol, $fn=200);
	cylinder(h=h_zwischen, r=12/2, $fn=100);
}

module demo_schraeg() {
	translate([0,0,-h_motor-h_uebermotor-1]) rotate(360/16 + $t*360) kupplung_motor();
	translate([0,0,h_zwischen+h_mutter+h_uebermutter+1])
		translate([0,-0.75,0]) rotate(3, [1,0,0])
		rotate(-360/16 + $t*360) mirror([0,0,1]) kupplung_mutter();
	/* 1.01, weil Renderkäfer */
	color("red") scale(1.01) rotate($t*360) kupplung_mitte();
}

module demo(explode=2) {
	translate([0,0,-h_motor-h_uebermotor-explode]) rotate(360/16 + $t*360) kupplung_motor();
	translate([0,0,h_zwischen+h_mutter+h_uebermutter+explode]) rotate(-360/16 + $t*360) mirror([0,0,1]) kupplung_mutter();
	/* 1.01, weil Renderkäfer */
	color("red") scale(1.01) rotate($t*360) kupplung_mitte();
}

demo();
