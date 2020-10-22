module StimHalfAdder ;

wire s,c ;
reg a,b ;

HalfAdder HOut(a,b,s,c) ;

initial 
begin
	a = 0 ; b = 0 ; #10 ; 
	a = 0 ; b = 1 ; #10 ;
	a = 1 ; b = 0 ; #10 ;
	a = 1 ; b = 1 ; #10 ;
end

endmodule 
