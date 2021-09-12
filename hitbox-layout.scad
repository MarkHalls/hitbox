module small() {
    circle(d=24);
}

module large() {
    circle(d=30);
}

module rightHand() {
    //http://www.slagcoin.com/joystick/layout/cluster36_m.png
    translate([0, 0, 0]) {
        children(0); //A
    }

    translate([31.25, 18, 0]) {
        children(0); //B
    }

    translate([0,18 * 2,0]) {
        children(0); //X
    }

    translate([31.25, 18 * 3, 0]) {
        children(0); //Y
    }

    translate([31.25 + 36, 18, 0]) {
        children(0); //RT
    }

    translate([31.25 + 36, 18 * 3, 0]) {
        children(0); //RB
    }

    translate([31.25 + 36 + 35, 9, 0]) {
        children(0); //LT
    }

    translate([31.25 + 36 + 35, (18 * 2) + 9, 0]) {
        children(0); //LB
    }
}

module leftHand() {
    translate([-36 -31.25, 18, 0]) {
        children(0); //L
    }

    translate([-31.25, 18, 0]) {
        children(0); //D
    }

    translate([0, 0, 0]) {
        children(0); //R    
    }

    translate([15, -54, 0]) {
        children(1); //U
    }
}

module hitbox() {
    translate([-16, 6, 0]) {
        rotate([0, 0, -15]) {
            leftHand() {
                small();
                large(); 
            };
        }
    }

    translate([16, -6, 0]) {
        rotate([0, 0, 15]) {
            rightHand() {
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