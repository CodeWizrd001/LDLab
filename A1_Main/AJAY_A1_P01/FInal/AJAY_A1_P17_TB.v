module SimDMux1x4; 	// 17

wire i0,i1,i2,i3;
reg [1:0] s;
reg o ;

DMux1x4 D(o,s,i0,i1,i2,i3) ;

initial 
begin
s = 2'b00 ; o=1'b0 ; #100 ;
s = 2'b00 ; o=1'b1 ; #100 ;
s = 2'b01 ; o=1'b0 ; #100 ;
s = 2'b01 ; o=1'b1 ; #100 ;
s = 2'b10 ; o=1'b0 ; #100 ;
s = 2'b10 ; o=1'b1 ; #100 ;
s = 2'b11 ; o=1'b0 ; #100 ;
s = 2'b11 ; o=1'b1 ; #100 ;
end 

endmodule 