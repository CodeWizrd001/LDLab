module StimDFlipFlopAResetHigh ;

wire q,q_ ;
reg d,c,re ;

DFlipFlopAResetHigh D(d,c,q,q_,re) ;

initial 
begin 
	c = 1'b1 ;
end

always 
begin 
	c = ~c ; #3 ;
end 

initial
begin
	d = 1'b0 ; re = 1'b0 ; #10 ; 
	d = 1'b1 ; #5 ; re = 1'b1 ; #5 ; re = 1'b0 ;
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #5 ; re = 1'b1 ; #5 ;
end

endmodule