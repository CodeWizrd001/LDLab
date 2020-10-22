module SimXor ;		// 5 

wire c ;
reg a,b ;

XorGate XG(a,b,c) ;

initial 
begin 
a = 1'b0 ; b = 1'b0 ;
#100 a = 1'b1 ; b = 1'b0 ;
#100 a = 1'b0 ; b = 1'b1 ;
#100 a = 1'b1 ; b = 1'b1 ; 
#100 ;
end

endmodule 