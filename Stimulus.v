module StimMultiplier ;

wire [15:0] c ;
reg clk ;
reg [15:0] a,b ; 

Multiplier M(a,b,c,clk) ; 

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
	a = 100 ; #100 ;
	b = 2 ; #100 ;
	a = 5 ; #100 ;
	b = 6 ; #100 ;
end

endmodule	

module StimMultiplier2a ;

wire [15:0] c ;
reg clk ;
reg [15:0] a,b ; 

Mult2a M(a,b,c,clk) ; 

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