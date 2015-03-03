motorside=true;

stab_d = 11.7;

/* Abstand der Schienen (Mitte - Mitte) */
schienen = 50;

d_kugellager = 30.4;
h_kugellager = 9;

/* Schraube M5x30:
 * 30mm - 2*1mm (Unterlegscheibe) - 4.5mm = 23.5mm
 */
blockh = 23;

difference() {
	translate([0,0,-blockh/4]) cube([(motorside ? 70 : 50), 75, blockh/2], true);

	for (y = [-1, +1]) {
		translate([0, y*schienen/2, 0]) cube([100, stab_d, stab_d], true);
	}
	cylinder(h=100, r=26.5/2, $fn=100, center=true);
	cylinder(h=h_kugellager, r=d_kugellager/2, $fn=100, center=true);
	for (x = [-1, +1]) {
		for (y = [-25/2, +25/2]) {
			translate([x*17.5, y, 0]) cylinder(h=100, r=5.7/2, $fn=50, center=true);
			if (motorside) {
			translate([x*57/2, y, 0]) cylinder(h=100, r=5.7/2, $fn=50, center=true);
			}
		}
	}
}

/* Bereich, in dem am Gegenstück der Schrittmotor montiert wird,
 * muss also für das äußere Schraubenpaar freigehalten werden
 */
% union() {
	cylinder(h=100, center=true, r=25/2, $fn=30);
	for (x = [-1, +1]) {
	for (y = [-1, +1]) {
		translate([x * 31/2, y * 31/2, 0]) cylinder(h=100, r=4.3/2, $fn=20, center=true);
	}
	}
	cube([45, 45, 100], true);
}
