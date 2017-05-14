module Mux_2X1 (a,b,s,y);
 input a,b;
 output y;
  input s;
  wire y ;
  assign y=(s)? b:a;
endmodule