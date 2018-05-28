$fn = 100;

module holder(d = 50)
{    
    w = 24;
    l = 45;

    h = 4;
    
    a = d - l/2;
    r = sqrt(a*a + w*w/4);
    theta = atan(0.4*w/a);
    
    translate([0, 0, 5 - h/2])
    cylinder(h = 10, d = 10, center = true);
    
    difference()
    {
        union()
        {
            rotate([0, 0, theta])
            translate([0, r/2])
            cube([h, r, h], center = true);
            
            rotate([0, 0, -theta])
            translate([0, r/2, 0])
            cube([h, r, h], center = true);
        }
        
        translate([0, d, 0])
        cube([w, l, h], center = true);        
    }
    
    translate([0, d, 0])
    {
        difference()
        {
            cube([w + 2*0.8, l + 2*0.8, h], center = true);
            translate([0, 0, h/3 - 0.8])
            #cube([w, l, h - 0.8], center = true);
        }
    }
    
    t = 2;
    
    translate([0, 0, -h / 2 + 0.5])
    {
        disk(12);
        disk(16);
    }
}

module disk(r, t = 2, h = 1)
{
    difference()
    {
        cylinder(r = r + t/2, h = h, center = true);
        cylinder(r = r - t/2, h = 1.5*h, center = true);
    }
}

difference()
{
    union()
    {
        holder();
        mirror([0, 1, 0])
        {   
            holder();
        }   
    }
    
    translate([0, 0, 10/2])
    cylinder(h = 20, d = 2, center = true);
    
    translate([0, 0, -4/2])
    {
        disk(12, t = 0.5, h = 0.4);
        disk(16, t = 0.5, h = 0.4);
    }
}
