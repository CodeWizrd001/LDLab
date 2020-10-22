module StimAdd16Bit ;

wire [15:0] o ;
reg [15:0] a,b ;

Add16Bit A(a,b,o) ;

initial 
begin 
	a = 15 ; b = 15 ; #10 ;
	a = 15 ; b = 0 ; #10 ;
	a = 0 ; b = 15 ; #10 ;
	a = 0 ; b = 0 ; #10 ;
	a = 962 ; b = 626 ; #10 ;
	a = 936 ; b = 772 ; #10 ;
	a = 485 ; b = 727 ; #10 ;
	a = 836 ; b = 753 ; #10 ;
end

endmodule
