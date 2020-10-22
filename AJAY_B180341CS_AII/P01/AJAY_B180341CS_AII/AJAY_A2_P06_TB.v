module StimInc16Bit ;

wire [15:0] o ;
reg [15:0] a ;
integer i ;

Inc16Bit IOut(a,o) ;

initial 
begin 
	for(i=0;i<65535;i=i+1051)
	begin 
		a = i ; #10 ;
	end
end

endmodule 
