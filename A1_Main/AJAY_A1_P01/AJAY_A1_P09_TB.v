module SimOr16 ;	// 9

wire [0:15] c;
reg [0:15] a,b ;

OrGate16 OG16_Out(a,b,c) ;

initial 
begin 
a = 100 ; b = 100 ; #100 ;
a = 200 ; b = 100 ; #100 ;
a = 235 ; b = 62 ; #100 ;
a = 3463 ; b = 63547 ; #100 ;
a = 348 ; b = 2672 ; #100 ;
a = 1953 ; b = 1180 ; #100 ;
a = 1512 ; b = 138 ; #100 ;
a = 12630 ; b = 10 ; #100 ;
end 

endmodule
