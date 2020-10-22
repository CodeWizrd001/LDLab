module StimInc4Bit ;

wire [3:0] o ;
reg [3:0] a ;
integer i ;

Inc4Bit IOut(a,o) ;

initial 
begin 
	for(i=0;i<16;i=i+1)
	begin 
		a = i ; #10 ;
	end
end

endmodule 
