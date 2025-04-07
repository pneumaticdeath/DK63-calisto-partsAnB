include <RoundAnything/polyround.scad>

width = 25.4*(11+5/8);
corner_radius = 4.75;

top_thickness = 25.4*0.52;
top_angle = 9.5;
top_depth = 25.4*(4+3/16);

bottom_angle = 10.5;
bottom_depth = 25.4*4;
bottom_thickness = 25.4;


// Trying to make a keyboard shaped plug 
translate([-width/2, 0, 0])
    rotate(a=bottom_angle, v=[1,0,0]) {
        translate([0, 0, 25.4*0.1875])
            rotate(a=top_angle, v=[1,0,0])
                // TOP
                shell( width, top_depth, top_thickness, corner_radius);
        shell( width, bottom_depth, bottom_thickness, corner_radius);
        translate([ 2*25.4, 25.4*3.9, 25.4*.1875])
            rotate(a=-5, v=[1,0,0])
                linear_extrude(height=25.4*0.875)
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
