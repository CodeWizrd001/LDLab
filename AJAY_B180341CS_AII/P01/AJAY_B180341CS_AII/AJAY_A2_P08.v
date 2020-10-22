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

module Neg16(a,b) ;

output [15:0] b ;
input [15:0] a ;

NotGate N[15:0](a,b) ;

endmodule

module Mux2x1(a,b,s,o) ;

output o ;
input a,b,s ;
wire s_,x,y ;

NotGate Ns(s,s_) ;
AndGate Aa(s_,a,x) ;
AndGate Ab(s,b,y) ;
OrGate O(x,y,o) ;

endmodule 

module Mux16b2x1(a,b,s,o) ;

output [15:0] o ;
input [15:0] a,b ;
input s ;

Mux2x1 M[15:0](a,b,s,o) ;

endmodule 

module AndGate16w1(a,b,c) ;

output [15:0] c ;
input [15:0] a ;
input b ; 

AndGate A[15:0](a,b,c) ;

endmodule 

module XorGate16w1(a,b,c) ;

output [15:0] c ;
input [15:0] a ;
input b ;

XorGate X[15:0](a,b,c) ;

endmodule

module AndGate16(a,b,c) ;

output [15:0] c ;
input [15:0] a,b ;

AndGate A[15:0](a,b,c) ;

endmodule 

module Nor16In(a,o) ;

output o ;
input [15:0] a ;
wire [14:0] x ;

OrGate O1(a[0],a[1],x[0]) ;
OrGate O2(a[2],a[3],x[1]) ;
OrGate O3(a[4],a[5],x[2]) ;
OrGate O4(a[6],a[7],x[3]) ;
OrGate O5(a[8],a[9],x[4]) ;
OrGate O6(a[10],a[11],x[5]) ;
OrGate O7(a[12],a[13],x[6]) ;
OrGate O8(a[14],a[15],x[7]) ;
OrGate O9(x[0],x[1],x[8]) ;
OrGate O10(x[2],x[3],x[9]) ;
OrGate O11(x[4],x[5],x[10]) ;
OrGate O12(x[6],x[7],x[11]) ;
OrGate O13(x[9],x[8],x[12]) ;
OrGate O14(x[11],x[10],x[13]) ;
OrGate O15(x[13],x[12],x[14]) ;

NotGate N(x[14],o) ;

endmodule 

module ALU(x,y,zx,nx,zy,ny,f,no,zr,ng,o) ;

output [15:0] o ;
output zr,ng ;
input [15:0] x,y ;
input zx,nx,zy,ny,f,no ;
wire [15:0] xz,yz,xn,yn,sm,an,to ;
wire zx_,zy_ ;

NotGate Nnx(zx,zx_) ;
NotGate Nny(zy,zy_) ;

AndGate16w1 Zx(x,zx_,xz) ;
AndGate16w1 Zy(y,zy_,yz) ;

XorGate16w1 Nx(xz,nx,xn) ;
XorGate16w1 Ny(yz,ny,yn) ;

Add16Bit Asm(xn,yn,sm) ;
AndGate16 Aan(xn,yn,an) ;
Mux16b2x1 Fout(an,sm,f,to) ;

XorGate16w1 No(to,no,o) ;

AndGate Ang(o[15],o[15],ng) ;
Nor16In Nzr(o,zr) ;

endmodule 