module StimModule2a ;

wire [15:0] c ;
reg clk ;
reg [15:0] a,b ; 

Mod2a M(a,b,c,clk) ; 

initial 
begin 
	clk = 0 ;
end

always
begin 
	clk = ~clk ; #1 ;
end

initial 
begin
	a = 0 ; b = 0 ;
	#10 ;
	a = 100 ; #50 ;
	b = 2 ; #50 ;
	a = 5 ; #50 ;
	b = 6 ; #50 ;
end

endmodule
