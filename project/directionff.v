//direction flipflop
module directionff (clk, resetn, high, low, increase, decrease);
	input clk;
	input resetn;
	input high;
	input low;
	output reg increase, decrease;
	
	always @ (posedge clk or negedge resetn)
	begin
		if (!resetn)
		begin
			increase <= 1;
			decrease <= 0;
		end
		else
		begin
			if (high)
			begin
				increase <= 1;
				decrease <= 0;
			end
			else if (low)
			begin
				increase <= 0;
				decrease <= 1;
			end
			else
			begin
				increase <= increase;
				decrease <= decrease;
			end
		end
	end
endmodule
