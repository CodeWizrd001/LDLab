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