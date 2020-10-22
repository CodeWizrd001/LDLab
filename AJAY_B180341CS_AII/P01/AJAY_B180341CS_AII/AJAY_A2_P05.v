module NotGate(a,b) ;

output b ;
input a ;

nand(b,a,a) ;

endmodule 

module AndGate(a,b,c) ;

output c ;
input a,b ;
wire x ;

nand(x,a,b) ;
nand(c,x,x) ; 

endmodule 

module OrGate(a,b,c) ;

output c ;
input a,b ;
wire x,y ;

nand(x,a,a) ;
nand(y,b,b) ;
nand(c,x,y) ;

endmodule 

module XorGate(a,b,c) ;

output c ; 
input a,b ;
wire a_,b_,x,y ;

NotGate Na(a,a_) ;
NotGate Nb(b,b_) ;
AndGate A1(a,b_,x) ;
AndGate A2(a_,b,y) ;
OrGate O(x,y,c) ;

endmodule 

module XnorGate(a,b,c) ;

output c ;
input a,b ;
wire x ;

XorGate X(a,b,x) ;
NotGate N(x,c) ;

endmodule 

module FullAdder(a,b,c0,s,c) ;

output s,c ;
input a,b,c0 ;
wire c_,x,x_,y,y_ ;

NotGate N(c0,c_) ;
XorGate X1(a,b,x) ;
XnorGate X2(a,b,x_) ;
AndGate A(a,b,y) ;
OrGate O(a,b,y_) ;
AndGate As1(x,c_,s1) ;
AndGate As2(x_,c0,s2) ;
AndGate Ac1(y,c_,c1) ;
AndGate Ac2(y_,c0,c2) ;
OrGate S(s1,s2,s) ;
OrGate C(c1,c2,c) ;

endmodule 

module Add16Bit(a,b,s) ;

output [15:0] s ;
input [15:0] a,b ;
wire [15:0] c ;

FullAdder F0(a[0],b[0],1'b0,s[0],c[0]) ;
FullAdder F1(a[1],b[1],c[0],s[1],c[1]) ;
FullAdder F2(a[2],b[2],c[1],s[2],c[2]) ;
FullAdder F3(a[3],b[3],c[2],s[3],c[3]) ;
FullAdder F4(a[4],b[4],c[3],s[4],c[4]) ;
FullAdder F5(a[5],b[5],c[4],s[5],c[5]) ;
FullAdder F6(a[6],b[6],c[5],s[6],c[6]) ;
FullAdder F7(a[7],b[7],c[6],s[7],c[7]) ;
FullAdder F8(a[8],b[8],c[7],s[8],c[8]) ;
FullAdder F9(a[9],b[9],c[8],s[9],c[9]) ;
FullAdder F10(a[10],b[10],c[9],s[10],c[10]) ;
FullAdder F11(a[11],b[11],c[10],s[11],c[11]) ;
FullAdder F12(a[12],b[12],c[11],s[12],c[12]) ;
FullAdder F13(a[13],b[13],c[12],s[13],c[13]) ;
FullAdder F14(a[14],b[14],c[13],s[14],c[14]) ;
FullAdder F15(a[15],b[15],c[14],s[15],c[15]) ;

endmodule 