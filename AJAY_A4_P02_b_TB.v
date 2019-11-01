module StimModule2b ;

wire [15:0] c ;
reg clk ;
reg [15:0] a,b ; 

Mod2b M(a,b,c,clk) ; 

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
	a = 8 ; #50 ;
	b = 2 ; #50 ;
	a = 8 ; #50 ;
	b = 3 ; #50 ;
	a = 5 ; #50 ;
	b = 2 ; #50 ;
	a = 6 ; #50 ;
	b = 7 ; #50 ;
end

endmodule