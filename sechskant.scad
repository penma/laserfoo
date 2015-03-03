
module sechskant(d_flaeche, h) {
	render() translate([0, 0, h/2]) intersection_for(a = [0, 60, 120]) {
		rotate([0, 0, a]) cube([d_flaeche, 3 * d_flaeche, h], true);
	}
}
