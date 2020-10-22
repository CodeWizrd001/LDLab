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

module HalfAdder(a,b,s,c) ;

output s,c ;
input a,b ;

AndGate A(a,b,c) ;
XorGate X(a,b,s) ;

endmodule 

module Inc16Bit(a,b) ;

output [15:0] b ;
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