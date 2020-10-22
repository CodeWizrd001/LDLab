module StimNeg16 ;

wire [15:0] o ;
reg [15:0] a ;

Neg16 N(a,o) ;

initial
begin 
	a = 151 ; #10 ;
	a = 1251 ; #10 ;
	a = 38563 ; #10 ;
	a = 47251 ; #10 ;
	a = 12845 ; #10 ;
	a = 8221 ; #10 ;
	a = 3732 ; #10 ;
	a = 1754 ; #10 ;
end

endmodule 
