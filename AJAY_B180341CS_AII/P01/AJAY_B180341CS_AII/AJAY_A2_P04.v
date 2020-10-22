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

module Add4Bit(a,b,s) ;

output [3:0] s ;
input [3:0] a,b ;
wire [3:0] c ;

FullAdder F1(a[0],b[0],1'b0,s[0],c[0]) ;
FullAdder F2(a[1],b[1],c[0],s[1],c[1]) ;
FullAdder F3(a[2],b[2],c[1],s[2],c[2]) ;
FullAdder F4(a[3],b[3],c[2],s[3],c[3]) ;

endmodule 