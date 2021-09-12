module small() {
    circle(d=24);
}

module large() {
    circle(d=30);
}

//thumb position is always last
leftHandLayout0 = [[-67.25, 18], [-31.25, 18], [0, 0], [15, -54]];

//http://www.slagcoin.com/joystick/layout/cluster36_m.png
rightHandLayout0 = [[0,0], [31.25, 18], [0, 36], [31.25, 54], 
    [67.25, 18], [67.25, 54], [102.25, 9], [102.25, 45]];

module rightHand(coords = []) {
    for (i = [ 0 : len(coords) - 1 ]) {
        point = coords[i];
        translate([point[0], point[1], 0]) {
            children(0);
        }
    }
}

module leftHand(coords = []) {
    for (i = [ 0 : len(coords) - 2 ]) {
        point = coords[i];
        translate([point[0], point[1], 0]) {
            children(0);
        }
    }

    thumb = coords[len(coords)-1];

    translate([thumb[0], thumb[1], 0]) {
        children(1);
    }
}

module hitbox() {
    translate([-16, 6, 0]) {
        rotate([0, 0, -15]) {
            leftHand(coords=leftHandLayout) {
                small();
                large(); 
            };
        }
    }

    translate([16, -6, 0]) {
        rotate([0, 0, 15]) {
            rightHand(coords=layout0) {
                small();
            };       
        }
    }
}

difference() {
    translate([20, 0, 0]) {
        square(size=[220, 220], center=true); 
    }
    hitbox();
}