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

module Nand3(a,b,c,o) ;

output o ;
input a,b,c ;
wire x,y ;

AndGate A(a,b,x) ;
AndGate B(x,c,y) ;
NotGate C(y,o) ;

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

module DLatchWR(d,c,q,q_,re) ;

output q,q_,re ;
input d,c ;
wire c_,s,r,x,y,re_ ;

AndGate S(d,d,s) ;
NotGate R(d,r) ;

nand(x,c,s) ;
nand(y,c,r) ;
Nand3 N1(q_,x,1'b1,q) ;
Nand3 N2(q,y,re,q_) ;

endmodule 

module DFlipFlopRE(d,c,q,q_) ;

output q,q_ ;
input d,c ;
wire c_,Q,Q_ ;

NotGate C_(c,c_) ;

DLatch D1(d,c_,Q,Q_) ;
DLatch D2(Q,c,q,q_) ;

endmodule 

module DFlipFlopSReset(d,c,q,q_,re) ;

output q,q_ ;
input d,c,re ;
wire re_,d_ ;

NotGate Re(re,re_) ;
AndGate A(d,re_,d_) ;
DFlipFlopRE Df(d_,c,q,q_) ;

endmodule 

module DFlipFlopAResetLow(d,c,q,q_,re) ;

output q,q_ ;
input d,c,re ;
wire Q,Q_,c_ ;

nand(c_,c,c) ;

DLatchWR D1(d,c_,Q,Q_,re) ;
DLatchWR D2(Q,c,q,q_,re) ;

endmodule 

module DFlipFlopAResetHigh(d,c,q,q_,re) ;

output q,q_ ;
input d,c,re ;
wire re_,Q,Q_ ;

NotGate R(re,re_) ;
NotGate N(c,c_) ;

DLatchWR D1(d,c_,Q,Q_,re_) ;
DLatchWR D2(Q,c,q,q_,re_) ;

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

module BinaryCellByPass(DIn,clk,cs,w,DOut) ;

output DOut ;
input DIn,clk,cs,w ;
wire s1,d,q,q_ ;

AndGate In(w,cs,s1) ;
AndGate Out(r,cs,s2) ;
Mux2x1 M1(q,DIn,s1,d) ;
DFlipFlopRE D(d,clk,q,q_) ;
Mux2x1 M2(q,q,1'b0,DOut) ;

endmodule

module Reg16Bit(DIn,clk,cs,w,r,DOut) ;

output [15:0] DOut ;
input [15:0] DIn;
input clk,cs,w,r ;

BinaryCell B[15:0](DIn,clk,cs,w,r,DOut) ; 

endmodule 

module Reg16BitByPass(DIn,clk,cs,w,DOut) ;

output [15:0] DOut ;
input [15:0] DIn;
input clk,cs,w ;

BinaryCellByPass B[15:0](DIn,clk,cs,w,DOut) ; 

endmodule 

module Mux2x1(a,b,s,c) ;  // 12

output c ;
input a,b,s ;
wire x,y,z ;

NotGate NG_1(s,z );
AndGate AG_1(a,z,x) ;
AndGate AG_2(b,s,y) ;
OrGate OG_1(x,y,c) ;

endmodule 

module Mux2x1_16(a,b,s,c) ;

output [15:0] c ;
input [15:0] a,b;
input s ;

Mux2x1 M[15:0](a,b,s,c) ;

endmodule

module Mux4x1(i0,i1,i2,i3,s1,s0,o) ;// 15

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

module Mux8x1(i1,i2,i3,i4,i5,i6,i7,i8,s0,s1,s2,o) ;		// 16

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

module HalfAdder(a,b,s,c) ;

output s,c ;
input a,b ;

AndGate A(a,b,c) ;
XorGate X(a,b,s) ;

endmodule 

module Inc16Bit(a,b) ;

output [15:0] b;
input [15:0] a ;
wire [15:0] c ;

HalfAdder H1(a[0],1'b1,b[0],c[0]) ;
HalfAdder H2(a[1],c[0],b[1],c[1]) ; 
HalfAdder H3(a[2],c[1],b[2],c[2]) ; 
HalfAdder H4(a[3],c[2],b[3],c[3]) ; 
HalfAdder H5(a[4],c[3],b[4],c[4]) ; 
HalfAdder H6(a[5],c[4],b[5],c[5]) ; 
HalfAdder H7(a[6],c[5],b[6],c[6]) ; 
HalfAdder H8(a[7],c[6],b[7],c[7]) ; 
HalfAdder H9(a[8],c[7],b[8],c[8]) ; 
HalfAdder H10(a[9],c[8],b[9],c[9]) ; 
HalfAdder H11(a[10],c[9],b[10],c[10]) ; 
HalfAdder H12(a[11],c[10],b[11],c[11]) ; 
HalfAdder H13(a[12],c[11],b[12],c[12]) ;
HalfAdder H14(a[13],c[12],b[13],c[13]) ; 
HalfAdder H15(a[14],c[13],b[14],c[14]) ; 
HalfAdder H16(a[15],c[14],b[15],c[15]) ;  

endmodule 

module PC(re,inc,load,l,clk,cs,w,r,DOut) ;

input re,inc,l,clk,cs,w,r ;
input [15:0] load ;
output [15:0] DOut ;
wire [15:0] d,D,D_,D__,D___,x ;
wire s2 ;

Mux2x1_16 M(DOut,load,l,d) ;
Inc16Bit I(d,D) ;
AndGate A[15:0](d,d,x) ;
Mux2x1_16 M2(x,D,inc,D_) ;
Mux2x1_16 M3(D_,16'b0,re,D__);
Reg16BitByPass R(D__,clk,cs,w,D___) ;
AndGate R_(cs,r,s2) ;
Mux2x1_16 MOut(16'bx,D___,s2,DOut) ;

endmodule 

module Shifter(c,a,q,c_,a_,q_) ;

output [15:0] a_,q_ ;
output c_ ;
input [15:0] a,q ;
input c ;

AndGate q_1[14:0](q[15:1],q[15:1],q_[14:0]) ;
AndGate q_2(a[0],a[0],q_[15]) ;
AndGate a_1[14:0](a[15:1],a[15:1],a_[14:0]) ;
AndGate a_2(c,c,a_[15]) ;
AndGate C(1'b0,1'b0,c_) ;

endmodule 

module Multiplier(a,b,c,clk) ;

output reg [15:0] c ;
input [15:0] a,b ; 
input clk ;
reg [31:0] temp,tempans ;
integer i ;

reg [2:0] addr ;
reg [15:0] a_,b_,DIn ;
wire [15:0] DOut ;

RAM8 R(1'b1,DIn,clk,addr,1'b1,1'b1,DOut) ;

always @(a)
begin
	a_ = a ;
	DIn = a ; addr = 3'b000 ; #3 ; 
end

always @(b)  
begin
	b_ = b ;
	DIn = b ; addr = 3'b001 ; #3 ;
end

always @(a_ or b_ )
begin
	tempans = 0;  
	for(i=0; i<16; i=i+1)
		if( a_[i] == 1'b1 )
			tempans = tempans + ( b_ << i ) ;
	temp = tempans ;
end

always @(temp)
begin 
		c = temp ;
		DIn = temp[15:0] ; addr = 3'b010 ; #3 ; 
		DIn = temp[31:16] ; addr = 3'b011 ; #3 ;
end

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

module Mult2a(X,Y,Out,clk) ;

output [15:0] Out ;
input [15:0] X,Y ;
input clk ;

// wire [15:0] sum,temp,x_,diff ;

reg [15:0] sum,diff ;

initial 
begin 
	sum = 0 ;
	diff = 0 ;
end

always @(X or Y)
begin 
	sum = X+Y ;
	diff = X-Y ; 
end

Multiplier M(sum,diff,Out,clk) ; 

endmodule
