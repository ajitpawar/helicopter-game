module score(clk, resetn, enable, collision, Q, HEX0, HEX1, HEX2, HEX3);
	
	input clk, resetn, enable, collision;
	output reg [15:0] Q; 	
	//output [15:0] LEDR;
	output [0:6] HEX0,HEX1,HEX2,HEX3;
	
	wire clkout;	
	freq_divider_1hz(clk, enable, clkout);
	
	always @(posedge clkout or negedge resetn) begin
		if(!resetn)
			Q <= 0;
		else if(enable)
				Q <= Q;
		else begin
			if(!collision)
				Q <= Q + 1;
			else
				Q <= Q;
		end
	end
		
	//assign LEDR = Q;	
	
	hex_7seg H3 (Q[15:12], HEX3);
	hex_7seg H2 (Q[11:8], HEX2);
	hex_7seg H1 (Q[7:4], HEX1);
	hex_7seg H0 (Q[3:0], HEX0);
	
endmodule


module freq_divider_1hz(clock, reset, out);
    input clock, reset;
    output reg out;
 
    reg [25:0] count;
     
    always @ (posedge clock)
    begin 
       if (~reset) begin
           if(count==50000000) begin
              count <= 0;
				  out <= 1;
           end else begin
              count <= count + 1;
				  out <= 0;
           end
       end else begin
          count <=0;
          out <= 0;
       end
    end
endmodule


module hex_7seg (hex, segment);
  input [15:0] hex;
  output reg [0:6] segment;

  always begin
    case(hex)
      0:segment=7'b0000001;
      1:segment=7'b1001111;
      2:segment=7'b0010010;
      3:segment=7'b0000110;
      4:segment=7'b1001100;
      5:segment=7'b0100100;
      6:segment=7'b0100000;
      7:segment=7'b0001111;
      8:segment=7'b0000000;
      9:segment=7'b0001100;
      10:segment=7'b0001000;
      11:segment=7'b1100000;
      12:segment=7'b0110001;
      13:segment=7'b1000010;
      14:segment=7'b0110000;
      15:segment=7'b0111000;
    endcase
  end
endmodule
