module SimNot16 ;

wire [0:15] b ;
reg [0:15] a ;

NotGate16 NG16_Out(a,b) ;

initial 
begin 
for(a=0;a<256;a=a+1)
#100 ;
end

endmodule
