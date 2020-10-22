module SimDMux1x8 ;

wire i0,i1,i2,i3,i4,i5,i6,i7;
reg [2:0] s ;
reg o ;

DMux1x8 D(o,s,i0,i1,i2,i3,i4,i5,i6,i7) ;
initial 
begin 
for(s=0;s<7;s=s+1)
	begin
	o = 1'b0 ; #100 ;
	o = 1'b1 ; #100 ;
	end 
o = 1'b0 ; #100 ;
o = 1'b1 ; #100 ;
end 

endmodule 
