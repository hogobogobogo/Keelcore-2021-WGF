//
// Model of vibrating vocal folds accirding to the description of:
// Tokuda, Zemke, Kob, & Herzel.
//
// Implementation P.Pabon & students
// Class Physical modeling 2014_2015 INSTITUTE OF SONOLOGY, Royal Conservatoire, The Hague
//
// ----------------- Slider control ----------
// To get the slider control I used the code from Andreas Schlegel, 2012, www.sojamo.de/libraries/controlp5
import controlP5.*;
ControlP5 cp5;
//
//
// definition of the masses that suspend the model
//
float m1_l=0.000009; // in Kilogram left VF Cover mass 1
float m2_l=0.000009; // Kilogram,   left VF Cover mass 2
float m3_l=0.000003; // Kilogram,   left VF Cover mass3
float mb_l=0.00005;  // Kilogram,   left VF base mass
//
float m1_r=0.000009; // in Kilogram right VF Cover mass 1
float m2_r=0.000009; // Kilogram,   right VF Cover mass 2
float m3_r=0.000003; // Kilogram,   right VF Cover mass3
float mb_r=0.00005;  // Kilogram,   right VF base mass
//
// There are no mass displacements in the y direction (along the length of the tract), 
// but there all forces operating in the y direction 
// There are no forces in the x-direction? and the oter way around
//
float x0=0;  // the relative zero offset o fthe VF model, plus is upstream
float x1=0.0005;  // meter (=0.05 cm)
float x2=0.002;   // meter (=0.2 cm)
float x3=0.00275; // meter (=0.275 cm)
float x4=0.003;   // meter (=0.3 cm) 
//
// So the whole model takes less then half a centimeter width of the total tract
//
// The y positions are the variables, but there is no y postion specified for
// time = zero, nor is there a zero force length associated with a spring.
//
float yb_l=-0.00005;  // meter (=0.005 cm) Veritcal base displacement arbiratry vaue already at time zero.
float y1_l=-0.00036;  // meter (=0.036 cm)  displacement already at time zero.
float y2_l=-0.00030;  // meter (=0.036 cm)  displacement already at time zero.
float y3_l=-0.00036;  // meter (=0.036 cm)  displacement already at time zero.
//
float yb_r=yb_l;  // meter (=0.05 cm) Veritcal base displacement arbiratry vaue already at time zero.
float y1_r=y1_l;  // meter (=0.36 cm)  displacement already at time zero.
float y2_r=y2_l;  // meter (=0.36 cm)  displacement already at time zero.
float y3_r=y3_l;  // meter (=0.36 cm)  displacement already at time zero.
//
float h0=0.018;  // meter (=1.8 cm() diameter or height called in the paper at VF entrance
float h4=0.018;  // meter (=1.8 cm() diameter or height called in the paper at VF exit
//
// This is an attempt to have an adduction parameter, a zero offset.
//
float adduct=(h4+h0)*100; // in mm, start at 1/5 of average tract width
//
//
float StartVel=0;
float Vyb_l= -StartVel;   // vertical velocity in meters per second of the base of the left vocal fold
float Vy1_l= -StartVel;   // vertical velocity in meters per second of mass1 of the left vocal fold
float Vy2_l= -StartVel;   // vertical velocity in meters per second of mass2 of the left vocal fold
float Vy3_l= -StartVel;   // vertical velocity in meters per second of mass3 of the left vocal fold
//
float Vyb_r= StartVel;   // vertical velocity in meters per second of the base of the right vocal fold
float Vy1_r= StartVel;   // vertical velocity in meters per second of mass1 of the right vocal fold
float Vy2_r= StartVel;   // vertical velocity in meters per second of mass2 of the right vocal fold
float Vy3_r= StartVel;   // vertical velocity in meters per second of mass3 of the right vocal fold
//
// Stiffnesses
//
float kb_l= 30;   // N/M left side
float k1_l= 6;   // N/M left side
float k2_l= 6;   // N/M left side
float k3_l= 6;   // N/M left side  // was 2
float k12_l= 1;   // N/M left side
float k23_l= 0.5;   // N/M left side
//
float kb_r= 30;   // N/M left side
float k1_r= 6;   // N/M left side
float k2_r= 6;   // N/M left side
float k3_r= k3_l;   // N/M left side
float k12_r= 1;   // N/M left side
float k23_r= 0.5;   // N/M left side
//
// Damping control
//
float Zetab=0.4;   // Damping ratio of base
float Zeta1=0.1;   // Damping ratio of cover mass 1
float Zeta2=0.4;   // Damping ratio of cover mass 2
float Zeta3=0.4;   // Damping ratio of cover mass 3
float Rb_l,R1_l,R2_l,R3_l;  // actual resistances used
float Rb_r,R1_r,R2_r,R3_r;  // actual resistances used
//
// Main control subglottal pressure Psub and its resultant flow Ug that is determined by the minimum width
int Psub= 2500;   // is in Pascal or N/square meter
float RhoNul = 1.13;   // Eta or so
float Glength=0.014; // Glottal length in meter
//
//  Collision stffness left and right VF
//
float CF=30;
float c1_lr=CF*k1_l;   // collsion stiffness left-right VF
float c2_lr=CF*k2_l;   // collsion stiffness left-right VF in N/M
float c3_lr=CF*k3_l;   // collsion stiffness left-right VF
float cb_lr=CF*kb_l;   // base collsion stiffness left-right VF, not in Tokuda's model
float ImpactZoneWidth=100000;
//
// To convert physical coordinates to screen coordinates
//
float PixelsPerMeter=40000;  //
float beginSubglottalTractAsScreenZero=0;  // 0 cm is leftmost point of model
float OffsetVFmodel=0.001;  // 5 cm from beginSubglottalTractAsScreenZero
float VerticalOffsetModel=400;  // in pixels, graphical offset
//
// time integration settings
//
float DeltaT=0.00002;   // in seconds
//Yvelocity = dy/dt= delta y/ delta t = y(t+T)-y(t)/T = 1/T*(y(t+T)-y(t))
//T*Yvelocity = y(t+T)-y(t)
//y(t+T)=y(t)+T*Yvelocity
//Yacceleration = dv/dt = delta v/delta t = 1/T*(v(t+T)-v(t))
//v(t+T)=v(t)+T*Yacceleration
//

void setup()
{
  size(400, 800);  // pixels to mm not set yet
  frameRate(50);
  Rb_l = 2*Zetab*sqrt(kb_l*mb_l);
  R1_l = 2*Zeta1*sqrt(k1_l*m1_l);
  R2_l = 2*Zeta2*sqrt(k2_l*m2_l);
  R3_l = 2*Zeta3*sqrt(k3_l*m3_l);
  Rb_r = 2*Zetab*sqrt(kb_r*mb_r);
  R1_r = 2*Zeta1*sqrt(k1_r*m1_r);
  R2_r = 2*Zeta2*sqrt(k2_r*m2_r);
  R3_r = 2*Zeta3*sqrt(k3_r*m3_r);
//
// Slider control of Psub
//
  cp5 = new ControlP5(this);
  // add a vertical slider, the value of this slider will be linked to variable 'sliderValue' 
  cp5.addSlider("Psub")
     .setPosition(300,550)
     .setSize(30,200)        // smaller number first makes it vertical
     .setRange(0,8000)
     .setValue(800)
     ;
  // reposition the Label for controller 'Psub'
  cp5.getController("Psub").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);
  cp5.getController("Psub").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  cp5 = new ControlP5(this);
  // add a vertical slider, the value of this slider will be linked to variable 'sliderValue' 
  cp5.addSlider("adduct")
     .setPosition(350,550)
     .setSize(30,200)        // smaller number first makes it vertical
     .setRange(0,90)  // displacement in mm * 10, max 0.9 cm is h0/2
     .setValue(10)
     ;
  // reposition the Label for controller 'VFadduction'
  cp5.getController("adduct").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);
  cp5.getController("adduct").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
}
//
// report on a change in slider value in the message window
//
void slider(float ThePSub) {
//  myColor = color(theColor);
  println("a slider event. changing Psub to: "+ThePSub);
}

/**
void mousePressed()
{
    stroke(0,255,0);  // black;
    ellipse(mouseX-5, mouseY-5,mouseX+5, mouseY+5);
}
void mouseMove()
{
}
*/

void draw()
{
float Accb_l, Acc1_l, Acc2_l, Acc3_l;   //accelerations
float Accb_r, Acc1_r, Acc2_r, Acc3_r;   //accelerations
float Xp1,Yp1,Xp2,Yp2;
float FR1b_l, FR2b_l, FR3b_l, FRbs_l;  // Resistive force between two masses with different velocities
float FR1b_r, FR2b_r, FR3b_r, FRbs_r;  // Resistive force between two masses with different velocities
float FS1b_l, FS2b_l, FS3b_l, FSbs_l, FS12_l, FS23_l;  // Spring force between two masses with different displcaments
float FS1b_r, FS2b_r, FS3b_r, FSbs_r, FS12_r, FS23_r;  // Spring force between two masses with different displcaments
float FC1_lr, FC2_lr,FC3_lr, FCb_lr;   // Collision forces Left-Right
float Dist1_lr, Dist2_lr, Dist3_lr, Distb_lr;     // Distance between the massses 1,2,3 & b, could be negative when they passed each other 
float Width1, Width2, Width3, Widthb;  // glottal width, is after the Heaviside function is applied.
float hxmin, hymin;  // smallest height, x and y values
float Ug, Ugmax;            // flow is calculated later
float P1,P2,P3,P4;      // Pressures at mass 1, 2 & 3 and Psupra ?
float CP0,CP1,CH1,CH2,OneOver,LNH2dH1,AvgPonPlate,TorqueOnPlateR,TorqueOnPlateL;  // variaables used in leverage/torque force calculation
float Faero0,Faero1,Faero2,Faero3,Faero4; // aerodynamic forces
float MinHight=0.00001;
float cWidth1, cWidth2, cWidth3;  // glottal width that will not become zero.
float adduction; // adduction in meter
//
  adduction = adduct/10000;  // from mm*10 to meter
//
// Grey background
//
 background(200,200,200);
//
// Plot a rectangle that shows the maximum heights from takuda's paper
//
float Maxh0 = 0.005;  // 0.5 cm max height. at low pitch and full power
   Xp1=(OffsetVFmodel+x0)*PixelsPerMeter;
   Yp1=(Maxh0/2)*PixelsPerMeter+VerticalOffsetModel;
   Xp2=(x4-x0)*PixelsPerMeter;
   Yp2=(-Maxh0)*PixelsPerMeter;
   fill(210,210,210);
   rect(Xp1, Yp1, Xp2, Yp2);
   Maxh0 = 0.0015;  // 0.15 cm max height. with tract attached
   Yp1=(Maxh0/2)*PixelsPerMeter+VerticalOffsetModel;
   Yp2=(-Maxh0)*PixelsPerMeter;
   fill(230,230,230);
   rect(Xp1, Yp1, Xp2, Yp2);
 //
 // base line of the tube/tract
 //
 stroke(0,0,0);  // black;
 Xp1=(OffsetVFmodel+x0)*PixelsPerMeter;
 Yp1=-(-h0/2)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x4)*PixelsPerMeter;
 Yp2=-(-h4/2)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=(OffsetVFmodel+x0)*PixelsPerMeter;
 Yp1=-(h0/2)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x4)*PixelsPerMeter;
 Yp2=-(h4/2)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
//
// Bottom (right Vocal fold perimeter
//
 stroke(64,64,64);  // grey
 Xp1=(OffsetVFmodel+x0)*PixelsPerMeter;
 Yp1=-(-h0/2)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x1)*PixelsPerMeter;
 Yp2=-(-h0/2+y1_r)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=Xp2;
 Yp1=Yp2;
 Xp2=(OffsetVFmodel+x2)*PixelsPerMeter;
 Yp2=-(-h0/2+y2_r)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=Xp2;
 Yp1=Yp2;
 Xp2=(OffsetVFmodel+x3)*PixelsPerMeter;
 Yp2=-(-h0/2+y3_r)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=Xp2;
 Yp1=Yp2;
 Xp2=(OffsetVFmodel+x4)*PixelsPerMeter;
 Yp2=-(-h0/2)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
//
// Top (Left Vocal fold perimeter
//
 Xp1=(OffsetVFmodel+x0)*PixelsPerMeter;
 Yp1=-(h0/2)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x1)*PixelsPerMeter;
 Yp2=-(h0/2+y1_l)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=Xp2;
 Yp1=Yp2;
 Xp2=(OffsetVFmodel+x2)*PixelsPerMeter;
 Yp2=-(h0/2+y2_l)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=Xp2;
 Yp1=Yp2;
 Xp2=(OffsetVFmodel+x3)*PixelsPerMeter;
 Yp2=-(h0/2+y3_l)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=Xp2;
 Yp1=Yp2;
 Xp2=(OffsetVFmodel+x4)*PixelsPerMeter;
 Yp2=-(h0/2)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
//
// plot base plates
//
 Xp1=(OffsetVFmodel+x1)*PixelsPerMeter;
 Yp1=-(-h0/2+yb_r)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x3)*PixelsPerMeter;
 Yp2=-(-h0/2+yb_r)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=(OffsetVFmodel+x1)*PixelsPerMeter;
 Yp1=-(h0/2+yb_l)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x3)*PixelsPerMeter;
 Yp2=-(h0/2+yb_l)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
//
// Plot the four left VF springs as a blue lines
//
 stroke(0,0,255);  // blue
 Xp1=(OffsetVFmodel+x1)*PixelsPerMeter;
 Yp1=-(-h0/2+yb_r)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x1)*PixelsPerMeter;
 Yp2=-(-h0/2+y1_r)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=(OffsetVFmodel+x2)*PixelsPerMeter;
 Yp1=-(-h0/2+yb_r)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x2)*PixelsPerMeter;
 Yp2=-(-h0/2+y2_r)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=(OffsetVFmodel+x3)*PixelsPerMeter;
 Yp1=-(-h0/2+yb_r)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x3)*PixelsPerMeter;
 Yp2=-(-h0/2+y3_r)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=(OffsetVFmodel+(x0+x4)*0.5)*PixelsPerMeter;
 Yp1=-(-h0/2+adduction)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+(x0+x4)*0.5)*PixelsPerMeter;
 Yp2=-(-h0/2+yb_r)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 ellipse(Xp1,Yp1,3,3);  // spring base offset with adduction
//
 Xp1=(OffsetVFmodel+x1)*PixelsPerMeter;
 Yp1=-(h0/2+yb_l)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x1)*PixelsPerMeter;
 Yp2=-(h0/2+y1_l)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=(OffsetVFmodel+x2)*PixelsPerMeter;
 Yp1=-(h0/2+yb_l)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x2)*PixelsPerMeter;
 Yp2=-(h0/2+y2_l)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=(OffsetVFmodel+x3)*PixelsPerMeter;
 Yp1=-(h0/2+yb_l)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x3)*PixelsPerMeter;
 Yp2=-(h0/2+y3_l)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 Xp1=(OffsetVFmodel+(x0+x4)*0.5)*PixelsPerMeter;
 Yp1=-(h0/2-adduction)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+(x0+x4)*0.5)*PixelsPerMeter;
 Yp2=-(h0/2+yb_l)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,Xp2,Yp2);
 ellipse(Xp1,Yp1,3,3);  // spring base offset with adduction
//
// Mouse interaction
//
/**
 if (mousePressed == true) {
 stroke(0,255,255);  // yellow
 Xp1=(OffsetVFmodel+x2)*PixelsPerMeter;
 Yp1=-(-h0/2+y2_r)*PixelsPerMeter+VerticalOffsetModel;
 Xp2=(OffsetVFmodel+x2)*PixelsPerMeter;
 Yp2=-(-h0/2+y2_r)*PixelsPerMeter+VerticalOffsetModel;
 line(Xp1,Yp1,mouseX,mouseY);
 }
*/
//
// the itterative scheme  displacements to forces and forces to new disclacements
//
//

// Resistive forces
//
  FR1b_l = R1_l*(Vy1_l-Vyb_l);
  FR2b_l = R2_l*(Vy2_l-Vyb_l);
  FR3b_l = R3_l*(Vy3_l-Vyb_l);
  FRbs_l = Rb_l*Vyb_l;    
//  
  FR1b_r = R1_r*(Vy1_r-Vyb_r);
  FR2b_r = R2_r*(Vy2_r-Vyb_r);
  FR3b_r = R3_r*(Vy3_r-Vyb_r);
  FRbs_r = Rb_r*Vyb_r;       
//
// Spring forces
//
   FS1b_l = k1_l*(y1_l-yb_l);
   FS2b_l = k2_l*(y2_l-yb_l);
   FS3b_l = k3_l*(y3_l-yb_l); 
   FSbs_l = kb_l*(yb_l+adduction); 
   FS12_l = k12_l*(y1_l-y2_l);
   FS23_l = k23_l*(y2_l-y3_l);
 // 
   FS1b_r = k1_r*(y1_r-yb_r);
   FS2b_r = k2_r*(y2_r-yb_r);
   FS3b_r = k3_r*(y3_r-yb_r); 
   FSbs_r = kb_r*(yb_r-adduction); 
   FS12_r = k12_r*(y1_r-y2_r);
   FS23_r = k23_r*(y2_r-y3_r); 
//
// Distances between the point masses
//
   Dist1_lr = (y1_l-y1_r+h0);   // distances between the mass points for left and right VF
   Dist2_lr = (y2_l-y2_r+h0);
   Dist3_lr = (y3_l-y3_r+h0);
   Distb_lr = (yb_l-yb_r+h0);
//
// Collision forces, Nonlinear springs for each mass collision that only are there when the distances are negative
//
   FC1_lr = Dist1_lr*c1_lr/(1+exp(Dist1_lr*ImpactZoneWidth));  // any forces that are generated as a resutl of collision
   FC2_lr = Dist2_lr*c2_lr/(1+exp(Dist2_lr*ImpactZoneWidth));
   FC3_lr = Dist3_lr*c3_lr/(1+exp(Dist3_lr*ImpactZoneWidth));
   FCb_lr = Distb_lr*cb_lr/(1+exp(Distb_lr*ImpactZoneWidth));
//
//  The actual width of the glottis at point mass 1,2,3 should never < 0, although the point masses\
//  collide and actually pass each other. These width functions are displayed 
//
   Width1 = Dist1_lr/(1+exp(-Dist1_lr*ImpactZoneWidth));
   Width2 = Dist2_lr/(1+exp(-Dist2_lr*ImpactZoneWidth));
   Width3 = Dist3_lr/(1+exp(-Dist3_lr*ImpactZoneWidth)); 
   Widthb = Distb_lr/(1+exp(-Distb_lr*ImpactZoneWidth));
//
// Note that in principle hymin, or the width could be larger the the actual width of the tract
// as the three corner points are able to move over their base at the vocal tract wall.
// it is not in the paper from Tokuda et al. but a limiter is implemented here.
// So, what to do is to check if (h0-hymin) < 0, and if so, apply this nonlinear function
// to zero this difference
//
   Width1 = Width1+(h0-Width1)/(1+exp(+(h0-Width1)*ImpactZoneWidth));
   Width2 = Width2+(h0-Width2)/(1+exp(+(h0-Width2)*ImpactZoneWidth));
   Width3 = Width3+(h0-Width3)/(1+exp(+(h0-Width3)*ImpactZoneWidth));
//
//  Find the smallest width and calculate Ug according to A6
//
   hymin = Width1; hxmin = x1;
   if (Width2 < hymin) { hymin = Width2; hxmin = x2;};
   if (Width3 < hymin) { hymin = Width3; hxmin = x3;};
//
// ---- hymin is known ---- so Ag(min) also --------and from that ----> Ug
//
   Ugmax = sqrt(2*Psub/RhoNul)*h0*Glength;
   Ug = sqrt(2*Psub/RhoNul)*hymin*Glength;
//
// plot flow measure
//
   Xp1=(OffsetVFmodel+x0)*PixelsPerMeter;
   Yp1=-(h0/2)*PixelsPerMeter+VerticalOffsetModel;
   Xp2=(x1)*PixelsPerMeter;
   Yp2=-(-h0/2)*PixelsPerMeter*Ug/Ugmax;
   fill(255,0,0);
   rect(Xp1, Yp1, Xp2, Yp2);
//
// plot the smallest width with a red circle
//
   Xp1=(OffsetVFmodel+hxmin)*PixelsPerMeter;
//   Yp1=-(-h0/2-hymin)*PixelsPerMeter+VerticalOffsetModel;
   Yp1=+VerticalOffsetModel;
   fill(255*(h0-hymin)/h0,0,0);    // red
   ellipse(Xp1, Yp1, 0.0002*PixelsPerMeter, hymin*PixelsPerMeter);
//
//  Aerodynamic force calculation
//
// Calculate average pressure at the plate sections, 
// and the amount of torque/leverage due the shift in centere of gravity or centroid
//
   CP0=Psub+RhoNul*0.5*pow(Ug/(Glength*hymin), 2);
   CP1=0.5*pow(Ug/(Glength), 2);
//
// not to have a zero width and not a zero width diffrence for H1.
//
   cWidth1 = Width1+MinHight; 
   cWidth2 = Width2+MinHight+MinHight; 
   cWidth3 = Width3+MinHight;
//
// Plate 0-1
//
   CH1=(cWidth1-h0);  // constant H1
   CH2=h0;           // constant H2
   LNH2dH1=log(cWidth1/h0);  // log() is ln() in Java
   OneOver=(1/cWidth1)-(1/h0);  // 1/h(i)-1/h(i-1)
   AvgPonPlate=CP0-CP1*(-OneOver/CH1);    // average pressure on plate in Pascal
   TorqueOnPlateR=CP0/2-CP1*(LNH2dH1+CH2*OneOver)/(CH1*CH1);    // Torque is dimensioned as a pressure, needs an area mutiplier to become a force
   TorqueOnPlateL=AvgPonPlate-TorqueOnPlateR;   // is torque (supported part of plate presure) at the left support point
   Faero1 = (x1-x0)*Glength*TorqueOnPlateL;
//   Faero0 = (x1-x0)*Glength*AvgPonPlate;
//   Faero0 = (x1-x0)*Glength*Psub;
    Faero0 = (x1-x0)*Glength*2000;
//
// Plate 1-2
//
   CH1=(cWidth2-cWidth1);  // constant H1
   CH2=cWidth1;           // constant H2
   LNH2dH1=log(cWidth2/cWidth1);  // log() is ln() in Java
   OneOver=(1/cWidth2)-(1/cWidth1);  // 1/h(i)-1/h(i-1)
   AvgPonPlate=CP0-CP1*(-OneOver/CH1);    // average pressure on plate in Pascal
   TorqueOnPlateR=CP0/2-CP1*(LNH2dH1+CH2*OneOver)/(CH1*CH1);    // Torque is dimensioned as a pressure, needs an area mutiplier to become a force
   TorqueOnPlateL=AvgPonPlate-TorqueOnPlateR;   // is torque (supported part of plate presure) at the left support point
   Faero1 = Faero1+(x2-x1)*Glength*TorqueOnPlateR;
   Faero2 =        (x2-x1)*Glength*TorqueOnPlateL;
//
// Plate 2-3
//
   CH1=(cWidth3-cWidth2);  // constant H1
   CH2=cWidth3;           // constant H2
   LNH2dH1=log(cWidth3/cWidth2);  // log() is ln() in Java
   OneOver=(1/cWidth3)-(1/cWidth2);  // 1/h(i)-1/h(i-1)
   AvgPonPlate=CP0-CP1*(-OneOver/CH1);    // average pressure on plate in Pascal
   TorqueOnPlateR=CP0/2-CP1*(LNH2dH1+CH2*OneOver)/(CH1*CH1);    // Torque is dimensioned as a pressure, needs an area mutiplier to become a force
   TorqueOnPlateL=AvgPonPlate-TorqueOnPlateR;   // is torque (supported part of plate presure) at the left support point
   Faero2 = Faero2+(x3-x2)*Glength*TorqueOnPlateR;
   Faero3 =        (x3-x2)*Glength*TorqueOnPlateL;
//
// Plate 3-4
//
   CH1=(h0-cWidth3);  // constant H1
   CH2=h0;           // constant H2
   LNH2dH1=log(h0/cWidth3);  // log() is ln() in Java
   OneOver=(1/h0)-(1/cWidth3);  // 1/h(i)-1/h(i-1)
   AvgPonPlate=CP0-CP1*(-OneOver/CH1);    // average pressure on plate in Pascal
   TorqueOnPlateR=CP0/2-CP1*(LNH2dH1+CH2*OneOver)/(CH1*CH1);    // Torque is dimensioned as a pressure, needs an area mutiplier to become a force
   TorqueOnPlateL=AvgPonPlate-TorqueOnPlateR;   // is torque (supported part of plate presure) at the left support point
   Faero3 = Faero3+(x4-x3)*Glength*TorqueOnPlateR;
//
// aerodynanimc force collapse
//
//  Faero1=0;
//  Faero2=0;
//  Faero3=0;
    if (hymin <= 0.0001) { Faero1=0;}
    if (hymin <= 0.0001) { Faero2=0;}
    if (hymin <= 0.0001) { Faero3=0;}
//  Faero1=-Faero1;
//  Faero2=-Faero2;
//  Faero3=-Faero3;
//
// Aerodynamic forces that depend on the smallesr width that sets the Flow as a fuction of the pressure differnce
//
   P1 =Psub-RhoNul*0.5*pow(Ug/(Width1*Glength), 2);  // the pressures directly depend on the glottal height
   P2 =Psub-RhoNul*0.5*pow(Ug/(Width2*Glength), 2);
   P3 =Psub-RhoNul*0.5*pow(Ug/(Width3*Glength), 2);
   P4 =Psub-RhoNul*0.5*pow(Ug/(h0*Glength), 2);
//
// Plot the four pressure values as green lines on top of the point mass locations
//
 stroke(0, 255, 0);  // green
 Xp1=(OffsetVFmodel+x1)*PixelsPerMeter;
 Xp2=Xp1;
 Yp1=-(h0/2+y1_l)*PixelsPerMeter+VerticalOffsetModel;
 Yp2=Yp1+(h0/2)*PixelsPerMeter*(Faero1)/(8*Faero0);
 line(Xp1,Yp1,Xp2,Yp2);  // 0-1
 Xp1=(OffsetVFmodel+x2)*PixelsPerMeter;
 Xp2=Xp1;
 Yp1=-(h0/2+y2_l)*PixelsPerMeter+VerticalOffsetModel;
 Yp2=Yp1+(h0/2)*PixelsPerMeter*(Faero2)/(8*Faero0);
 line(Xp1,Yp1,Xp2,Yp2);  // 1-2
 Xp1=(OffsetVFmodel+x3)*PixelsPerMeter;
 Xp2=Xp1;
 Yp1=-(h0/2+y3_l)*PixelsPerMeter+VerticalOffsetModel;
 Yp2=Yp1+(h0/2)*PixelsPerMeter*(Faero3)/(8*Faero0);
 line(Xp1,Yp1,Xp2,Yp2);  //2-3
//
// Accelerations from combined forces
//
  Acc1_l=(-FS1b_l-FR1b_l-FS12_l-FC1_lr-Faero1)/m1_l;   // covers formula A1 at page 1533 of Takuda's article
  Acc1_r=(-FS1b_r-FR1b_r-FS12_r+FC1_lr+Faero1)/m1_r;
  Acc2_l=(-FS2b_l-FR2b_l+FS12_l-FS23_l-FC2_lr-Faero2)/m2_l;
  Acc2_r=(-FS2b_r-FR2b_r+FS12_r-FS23_r+FC2_lr+Faero2)/m2_r;
  Acc3_l=(-FS3b_l-FR3b_l+FS23_l-FC3_lr-Faero3)/m3_l; 
  Acc3_r=(-FS3b_r-FR3b_r+FS23_r+FC3_lr+Faero3)/m3_r; 
  Accb_l=(-FRbs_l-FSbs_l+FR1b_l+FS1b_l+FR2b_l+FS2b_l+FR3b_l+FS3b_l-FCb_lr)/mb_l;
  Accb_r=(-FRbs_r-FSbs_r+FR1b_r+FS1b_r+FR2b_r+FS2b_r+FR3b_r+FS3b_r+FCb_lr)/mb_r;
//
// from accel->velocity->newdipsplacement
//
  Vyb_l = Vyb_l + DeltaT*Accb_l;  yb_l  = yb_l  + DeltaT*Vyb_l;
  Vy1_l = Vy1_l + DeltaT*Acc1_l;  y1_l  = y1_l  + DeltaT*Vy1_l;
  Vy2_l = Vy2_l + DeltaT*Acc2_l;  y2_l  = y2_l  + DeltaT*Vy2_l;
  Vy3_l = Vy3_l + DeltaT*Acc3_l;  y3_l  = y3_l  + DeltaT*Vy3_l;
//
  Vyb_r = Vyb_r + DeltaT*Accb_r;  yb_r  = yb_r  + DeltaT*Vyb_r;
  Vy1_r = Vy1_r + DeltaT*Acc1_r;  y1_r  = y1_r  + DeltaT*Vy1_r;
  Vy2_r = Vy2_r + DeltaT*Acc2_r;  y2_r  = y2_r  + DeltaT*Vy2_r;
  Vy3_r = Vy3_r + DeltaT*Acc3_r;  y3_r  = y3_r  + DeltaT*Vy3_r;
}
