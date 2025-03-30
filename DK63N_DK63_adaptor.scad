include <RoundAnything/polyround.scad>

shell( 25.4*(11+9/16), 25.4*(4+3/16), 30.2, 4.75);

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
		[-width/2, -depth/2, corner_radius],
		[-width/2, depth/2, corner_radius],
		[width/2, depth/2, corner_radius],
		[width/2, -depth/2, corner_radius]
	];
	

		
	linear_extrude(height=height)
		polygon(polyRound(outline));
}
