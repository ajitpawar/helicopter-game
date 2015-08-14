//delayer

module delayer (clk, resetn, enable, done);
	input clk, resetn, enable;
	output reg done;
	reg [24:0] count;
	always @ (posedge clk or negedge resetn)
	begin
		if (!resetn)
		begin
			count <= 0;
			done <= 0;
		end
		else if (!enable)
		begin
			count <= count;
			done <= 0;
		end
		else
		begin
			if (count < 25'd05000000)	// 5m clock cyles = 5Mhz
			begin
				count <= count + 1;
				done <= 0;
			end
			else
			begin
				count <= count;
				done <= 1;
			end
		end
	end
endmodule
