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

module Mux2x1(a,b,s,c) ;

output c ;
input a,b,s ;
wire x,y,z ;

NotGate NG_1(s,z );
AndGate AG_1(a,z,x) ;
AndGate AG_2(b,s,y) ;
OrGate OG_1(x,y,c) ;

endmodule 

module DLatch(d,c,q,q_) ;

output q,q_ ;
input d,c ;
wire c_,s,r,x,y ;

AndGate S(d,d,s) ;
NotGate R(d,r) ;
nand(x,c,s) ;
nand(y,c,r) ;
nand(q,q_,x) ;
nand(q_,q,y) ;

endmodule 

module DFlipFlopRE(d,c,q,q_) ;

output q,q_ ;
input d,c ;
wire c_,Q,Q_ ;

NotGate C_(c,c_) ;

DLatch D1(d,c_,Q,Q_) ;
DLatch D2(Q,c,q,q_) ;

endmodule 

module BinaryCell(DIn,clk,cs,w,r,DOut) ;

output DOut ;
input DIn,clk,cs,w,r ;
wire s1,s2,d,q,q_ ;

AndGate In(w,cs,s1) ;
AndGate Out(r,cs,s2) ;
Mux2x1 M1(q,DIn,s1,d) ;
DFlipFlopRE D(d,clk,q,q_) ;
Mux2x1 M2(1'bx,q,s2,DOut) ;

endmodule

module Reg16Bit(DIn,clk,cs,w,r,DOut) ;

output [15:0] DOut ;
input [15:0] DIn;
input clk,cs,w,r ;

BinaryCell B[15:0](DIn,clk,cs,w,r,DOut) ; 

endmodule

module DeCoder2(e,i,o) ;

output [1:0] o ;
input e,i ;
wire i_ ;

NotGate Ne(i,i_) ;
AndGate O1(i_,e,o[0]) ;
AndGate O2(i,e,o[1]) ;

endmodule 

module DeCoder4(e,i,o) ;

output [3:0] o ;
input [1:0] i ;
input e ;
wire [1:0] t ;

DeCoder2 D1(e,i[1],t[1:0]) ;
DeCoder2 D2(t[1],i[0],o[3:2]) ;
DeCoder2 D3(t[0],i[0],o[1:0]) ;

endmodule 

module DeCoder8(e,i,o) ;

output [7:0] o ;
input [2:0] i ;
input e ;
wire [1:0] t ;

DeCoder2 D1(e,i[2],t[1:0]);
DeCoder4 D2(t[0],i[1:0],o[3:0]) ;
DeCoder4 D3(t[1],i[1:0],o[7:4]) ;

endmodule 

module Mux4x1(i0,i1,i2,i3,s1,s0,o) ;

output o ;
input i0,i1,i2,i3 ;
input s1,s0;
wire x,y ;

Mux2x1 M_1(i0,i1,s1,x);
Mux2x1 M_2(i2,i3,s1,y) ;
Mux2x1 M_3(x,y,s0,o) ;

endmodule

module Mux4x1_16(i0,i1,i2,i3,s,o) ;

output [15:0] o ;
input [15:0] i0,i1,i2,i3 ;
input [1:0] s ;

Mux4x1 M[15:0](i0,i1,i2,i3,s[0],s[1],o) ;

endmodule

module Mux8x1(i1,i2,i3,i4,i5,i6,i7,i8,s0,s1,s2,o) ;		

output o ;
input i1,i2,i3,i4,i5,i6,i7,i8 ;
input s2,s1,s0 ;
wire x,y ;

Mux4x1 M1(i1,i2,i3,i4,s0,s1,x) ;
Mux4x1 M2(i5,i6,i7,i8,s0,s1,y) ;
Mux2x1 M3(x,y,s2,o) ;

endmodule 

module Mux8x1_16(i1,i2,i3,i4,i5,i6,i7,i8,s,o) ;

output [15:0] o ;
input [15:0] i1,i2,i3,i4,i5,i6,i7,i8 ;
input [2:0] s ;

Mux8x1 M[15:0](i1,i2,i3,i4,i5,i6,i7,i8,s[0],s[1],s[2],o) ;

endmodule

module RAM8(e,DIn,clk,addr,w,r,DOut) ;

output [15:0] DOut ;
input [15:0] DIn ;
input clk,w,r,e ;
input [2:0] addr ;
wire [7:0] cs ;
wire [15:0] o1,o2,o3,o4,o5,o6,o7,o8 ;

DeCoder8 Addr(e,addr,cs) ;
Reg16Bit r1(DIn,clk,cs[0],w,r,o1) ;
Reg16Bit r2(DIn,clk,cs[1],w,r,o2) ;
Reg16Bit r3(DIn,clk,cs[2],w,r,o3) ;
Reg16Bit r4(DIn,clk,cs[3],w,r,o4) ;
Reg16Bit r5(DIn,clk,cs[4],w,r,o5) ;
Reg16Bit r6(DIn,clk,cs[5],w,r,o6) ;
Reg16Bit r7(DIn,clk,cs[6],w,r,o7) ;
Reg16Bit r8(DIn,clk,cs[7],w,r,o8) ;

Mux8x1_16 M(o1,o2,o3,o4,o5,o6,o7,o8,addr,DOut) ;

endmodule 