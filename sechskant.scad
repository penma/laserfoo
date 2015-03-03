
module sechskant(sw, h) {
	render() translate([0, 0, h/2]) intersection_for(a = [0, 60, 120]) {
		rotate([0, 0, a]) cube([sw, 3 * sw, h], true);
	}
}
