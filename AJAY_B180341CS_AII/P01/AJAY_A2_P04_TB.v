module StimAdd4Bit ;

wire [3:0] o ;
reg [3:0] a,b ;

Add4Bit A(a,b,o) ;

initial 
begin 
	a = 15 ; b = 15 ; #10 ;
	a = 15 ; b = 0 ; #10 ;
	a = 0 ; b = 15 ; #10 ;
	a = 0 ; b = 0 ; #10 ;
	a = 9 ; b = 6 ; #10 ;
	a = 9 ; b = 7 ; #10 ;
	a = 5 ; b = 7 ; #10 ;
	a = 6 ; b = 7 ; #10 ;
end

endmodule
