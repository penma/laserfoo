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
yframe_h = 75;

module yframe_klemmleiste(breite = 50) {
	difference() {
		translate([0,0,-blockh/4]) cube([breite, yframe_h, blockh/2], true);

		for (y = [-1, +1]) {
			translate([0, y*schienen/2, 0]) cube([100, stab_d, stab_d], true);
		}
	}
}
