include <YFrame.scad>;

difference() {
	yframe_klemmleiste(breite=blockh);
	for (y = [-schienen/2, +schienen/2]) {
		translate([0,y,0]) cylinder(h=100, r=5.7/2, $fn=50, center=true);
	}
	cube([stab_d, stab_d, 100], true);
	rotate(90, [0,1,0]) cylinder(h=100, center=true, r=5.7/2, $fn=50);
}
