$fn = 320;

grid = 10;
beam = 3;
width = 20*grid+beam;
length = 16*grid+beam;

union() {
	// frame
	cube([beam,length,beam]);
	cube([width,beam,beam]);
	translate([0,length-beam,0]) {
		cube([width,beam,beam]);
	}
	translate([width-beam,0,0]) {
		cube([beam,length,beam]);
	}

	// legs in the corners 
	cube([beam,grid+beam,10]);
	cube([grid+beam,beam,10]);
	translate([0,length-grid-beam,0]) {
		cube([beam,grid+beam,10]);
	}
	translate([width-beam,length-grid-beam,0]) {
		cube([beam,grid+beam,10]);
	}
	translate([width-beam,0,0]) {
		cube([beam,grid+beam,10]);
	}
	translate([width-grid-beam,0,0]) {
		cube([grid+beam,beam,10]);
	}
	translate([width-grid-beam,length-beam,0]) {
		cube([grid+beam,beam,10]);
	}
	translate([0,length-beam,0]) {
		cube([grid+beam,beam,10]);
	}

	// crossed leg in the middle
	translate([(width-beam)/2-grid,(length-beam)/2,0]) {
		cube([2*grid+beam,beam,10]);
	}
	translate([(width-beam)/2,(length-beam)/2-grid,0]) {
		cube([beam,2*grid+beam,10]);
	}

	// the grid
	for (i = [grid : grid : width]) {
		translate([i, 0, 0]) {
			cube([beam,length,beam]);
		}
	}
	for (i = [grid : grid : length]) {
		translate([0, i, 0]) {
			cube([width,beam,beam]);
		}
	}

}
