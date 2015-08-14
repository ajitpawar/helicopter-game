module levels(clk, resetn, enable, collision, score, level, HEX4);
	input clk, resetn, enable, collision;
	input [15:0] score;
	output reg [2:0] level;
	output [0:6] HEX4; 
	
	always @ (posedge clk or negedge resetn)
	begin
		if(!resetn) begin
			level <= 0;
		end
		else if(!enable) begin
			level <= level;
		end
		else begin
			if(score == 0) level <= 0;
			else if(score>0 && score < 16) level <= 1;
			else if(score < 32) level <= 2;
			else if(score < 48) level <= 3;
			else if(score < 64) level <= 4;
			else level <= 5;
		end
	end
	
	hx_7seg H4 (level, HEX4);
	
endmodule


module hx_7seg (hex, segment);
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