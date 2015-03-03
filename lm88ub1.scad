// RJMP 01-08

blockwidth=30;
blockdepth=40;
screwdistx=4;
screwdisty=5;
d_rjmp=16.4;
l_rjmp=25.2;

!difference() {
	cube([blockwidth, blockdepth, 25/2]);
	translate([blockwidth/2, -1, 25/2]) rotate(90, [-1,0,0]) cylinder(r=13/2, h=100, $fn=100);
	translate([blockwidth/2, (blockdepth-l_rjmp)/2, 25/2]) rotate(90, [-1,0,0]) cylinder(r=d_rjmp/2, h=l_rjmp, $fn=100);

	translate([screwdistx, screwdisty, -1]) cylinder(r=4.5/2, h=100, $fn=40);
	translate([screwdistx, blockdepth-screwdisty, -1]) cylinder(r=4.5/2, h=100, $fn=40);
	translate([blockwidth-screwdistx, screwdisty, -1]) cylinder(r=4.5/2, h=100, $fn=40);
	translate([blockwidth-screwdistx, blockdepth-screwdisty, -1]) cylinder(r=4.5/2, h=100, $fn=40);
}

// Tr10x2 nut
translate([40,0,0])
difference() {
	cube([40, 30, 25/2]);
	translate([20, -1, 25/2]) rotate(90, [-1,0,0]) cylinder(r=13/2, h=100, $fn=100);
	translate([20, (30-20)/2, 25/2]) rotate(90, [-1,0,0]) cylinder(r=22.3/2, h=20, $fn=100);

	translate([5, 5, -1]) cylinder(r=4.5/2, h=100, $fn=40);
	translate([5, 25, -1]) cylinder(r=4.5/2, h=100, $fn=40);
	translate([35, 5, -1]) cylinder(r=4.5/2, h=100, $fn=40);
	translate([35, 25, -1]) cylinder(r=4.5/2, h=100, $fn=40);
}