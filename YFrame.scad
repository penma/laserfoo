/* Rahmenteile für die Y-Achse (Platine bewegt)
 */

/* Durchmesser Aluprofile */
stab_d = 11.7;

/* Abstand der Schienen (Mitte-Mitte) */
schienen = 50;

/* Blockhöhe - Schraube M5x30:
 * 30mm - 2*1mm (Unterlegscheibe) - 4.5mm = 23.5mm
 */
blockh = 23;

/* Höhe der Y-Einheit */
yframe_h = 60;

module halfchamfered_box(x, y, z, cham) {
	difference() {
		cube([x, y, z]);
		translate([0,-1,0]) rotate(-90, [1,0,0]) linear_extrude(height=y+2) union() {
			polygon([
				[-1, 1],
				[-1, -cham-1],
				[cham+1, 1]
			]);
			polygon([
				[x+1, 1],
				[x+1, -cham-1],
				[x-cham-1, 1]
			]);
		};
		translate([-1,0,0]) rotate(90, [0,1,0]) linear_extrude(height=x+2) union() {
			polygon([
				[1, -1],
				[1, cham+1],
				[-cham-1, -1]
			]);
			polygon([
				[1, y+1],
				[1, y-cham-1],
				[-cham-1, y+1]
			]);
		};
	}
}

module yframe_klemmleiste(breite = 50) {
	difference() {
		translate([-breite/2,-yframe_h/2,-blockh/2]) halfchamfered_box(breite, yframe_h, blockh/2, 2);

		for (y = [-1, +1]) {
			translate([0, y*schienen/2, 0]) cube([100, stab_d, stab_d], true);
		}
	}
}
