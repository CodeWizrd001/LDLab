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

module DFlipFlopFE(d,c,q,q_) ;

output q,q_ ;
input d,c ;
wire c_,Q,Q_ ;

NotGate C_(c,c_) ;

DLatch D1(d,c,Q,Q_) ;
DLatch D2(Q,c_,q,q_) ;

endmodule 
