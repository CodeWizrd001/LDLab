module SimMux ;		// 12

wire c ;
reg a,b,s ;

Mux2x1 M_1(a,b,s,c) ;

initial 
begin 
s = 1'b0 ; a = 1'b0 ; b = 1'b0 ;
#100 s = 1'b0 ; a = 1'b0 ; b = 1'b1 ;
#100 s = 1'b0 ; a = 1'b1 ; b = 1'b0 ;
#100 s = 1'b0 ; a = 1'b1 ; b = 1'b1 ;
#100 s = 1'b1 ; a = 1'b0 ; b = 1'b0 ;
#100 s = 1'b1 ; a = 1'b0 ; b = 1'b1 ;
#100 s = 1'b1 ; a = 1'b1 ; b = 1'b0 ;
#100 s = 1'b1 ; a = 1'b1 ; b = 1'b1 ;
#100 ;
end

endmodule
