include <RoundAnything/polyround.scad>

// Trying to make a keyboard shaped plug 
translate([-25.4*(11+9/16)/2, 0, 0])
    rotate(a=10, v=[1,0,0]) {
        translate([0, 0, 25.4*0.1875])
            rotate(a=10, v=[1,0,0])
                shell( 25.4*(11+9/16), 25.4*(4+3/16), 25.4*0.5, 4.75);
        shell( 25.4*(11+9/16), 25.4*4, 25.4, 4.75);
        translate([ 2*25.4, 25.4*3.9, 25.4*.1875])
            linear_extrude(height=25.4*0.8125)
                square([25.4*3/4, 25.4*2]);
    };
                    

/* 
// Left = 1, right = -1
side = -1;

difference() {
    tray();
    translate([0,0,-10])
        linear_extrude(height=40)
            polygon([
                [ 0, -150],
                [ 0, 150],
                [ side*160, 150],
                [ side*160, -150]
            ]);
};
*/                    

module tray() 
{
    difference() {
        shell(304.8, 142.24, 25.4*3/8, 25.4/8);
        translate([0, (142.24-102.15)/2, 25.4*3/8-7.45]) 
            shell(292.1, 102.17, 7.46, 1);
    }
}

module shell (width, depth, height, corner_radius)
{
    outline = [
		[0, 0, corner_radius],
		[width, 0, corner_radius],
		[width, depth, corner_radius],
		[0, depth, corner_radius]
	];
	

		
	linear_extrude(height=height)
		polygon(polyRound(outline));
}
