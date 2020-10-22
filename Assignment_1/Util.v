module AndGate3In(i1,i2,i3,o) ;

output o ;
input i1,i2,i3 ;
wire x ;

AndGate A1(i1,i2,x) ;
AndGate A2(i3,x,o) ;

endmodule 

module AndGate4In(i1,i2,i3,i4,o) ;

output o ;
input i1,i2,i3,i4 ;
wire x,y ;

AndGate A1(i1,i2,x) ;
AndGate A2(i3,i4,y) ;
AndGate A3(x,y,o) ;

endmodule 
/*
module Mux16x1(i,s,o) ;

output o;
input [15:0] i ;
input [3:0] s ;
wire s3,s2,s1,s0;

NotGate N1(s[3],s3) ;
NotGate N2(s[2],s2) ;
NotGate N3(s[1],s1) ;
NotGate N4(s[0],s0) ;

wire x1,x2,x3,x4,x5,x6,x7,x8,x ;
wire y1,y2,y3,y4,y5,y6,y7,y8,y,y_ ;

AndGate5In Ai1(i[0],s0,s1,s2,s3,x1) ;
AndGate5In Ai2(i[1],s[0],s1,s2,s3,x2) ;
AndGate5In Ai3(i[2],s0,s[1],s2,s3,x3) ;
AndGate5In Ai4(i[3],s[0],s[1],s2,s3,x4) ;
AndGate5In Ai5(i[4],s0,s1,s[2],s3,x5) ;
AndGate5In Ai6(i[5],s[0],s1,s[2],s3,x6) ;
AndGate5In Ai7(i[6],s0,s[1],s[2],s3,x7) ;
AndGate5In Ai8(i[7],s[0],s[1],s[2],s3,x8) ;

OrGate8In O1(x1,x2,x3,x4,x5,x6,x7,x8,x) ;

AndGate5In Aj1(i[8],s0,s1,s2,s[3],y1) ;
AndGate5In Aj2(i[9],s[0],s1,s2,s[3],y2) ;
AndGate5In Aj3(i[10],s0,s[1],s2,s[3],y3) ;
AndGate5In Aj4(i[11],s[0],s[1],s2,s[3],y4) ;
AndGate5In Aj5(i[12],s0,s1,s[2],s[3],y5) ;
AndGate5In Aj6(i[13],s[0],s1,s[2],s[3],y6) ;
AndGate5In Aj7(i[14],s0,s[1],s[2],s[3],y7) ;
AndGate5In Aj8(i[15],s[0],s[1],s[2],s[3],y8) ;

OrGate8In O2(y1,y2,y3,y4,y5,y6,y7,y8,y) ;

OrGate O3(x,y,o) ;

endmodule 

module Mux16x1by4(i,s,o) ;

output o ;
input [15:0] i ;
input [3:0] s ;
wire w,x,y,z ;

Mux4x1 M1(i[15],i[14],i[13],i[12],s[1],s[0],w) ;
Mux4x1 M2(i[11],i[10],i[9],i[8],s[1],s[0],x) ;
Mux4x1 M3(i[7],i[6],i[5],i[4],s[1],s[0],y) ;
Mux4x1 M4(i[3],i[2],i[1],i[0],s[1],s[0],z) ;
Mux4x1 M(w,x,y,z,s[3],s[2],o) ;

endmodule

module Mux16x1by8(i,s,o) ;

output o ;
input [15:0] i ;
input [3:0] s ;
wire w,x,y,z ;

Mux8x1 M1(i[15:8],s[2:0],x) ;
Mux8x1 M2(i[7:0],s[2:0],y) ;
Mux2x1 M3(x,y,s[3],o) ;

endmodule */