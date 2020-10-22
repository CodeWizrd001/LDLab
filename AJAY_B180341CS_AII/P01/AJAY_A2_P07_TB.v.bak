module StimFullAdder ;

wire s,c ;
reg a,b,c0 ;

FullAdder FOut(a,b,c0,s,c) ;

initial 
begin
	c0 = 0 ; a = 0 ; b = 0 ; #10 ; 
	c0 = 0 ; a = 0 ; b = 1 ; #10 ;
	c0 = 0 ; a = 1 ; b = 0 ; #10 ;
	c0 = 0 ; a = 1 ; b = 1 ; #10 ;
	c0 = 1 ; a = 0 ; b = 0 ; #10 ; 
	c0 = 1 ; a = 0 ; b = 1 ; #10 ;
	c0 = 1 ; a = 1 ; b = 0 ; #10 ;
	c0 = 1 ; a = 1 ; b = 1 ; #10 ;
end

endmodule 
