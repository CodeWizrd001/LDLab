module StimDFlipFlopFE ;

wire q,q_ ;
reg d,c ;

DFlipFlopFE D(d,c,q,q_) ;

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
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #10 ;
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #10 ;
end

endmodule
