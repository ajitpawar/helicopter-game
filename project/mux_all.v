module mux_all(select1, select2, select3, colour1, colour2, colour3, colour,
	x1, x2, x3, x, y1, y2, y3, y, collision, check, doneCheck,
	select4, colour4, x4, y4);

	input [2:0] colour1, colour2, colour3;
	input [7:0] x1,x2,x3;					// x1=B, x2=A, x3=heli, x4=C
	input select1, select2, select3;
	input [6:0] y1,y2,y3;					// y1=B, y2=A, y3=heli, y4=C
	input check;
	output reg [2:0] colour;
	output reg [7:0] x;
	output reg [6:0] y;
	output reg collision, doneCheck;
	
	input select4;
	input [2:0] colour4;
	input [7:0] x4;
	input [6:0] y4;
	
	always@(*)
		if (select1 == 1 && select2 == 0) begin		// B selected
			colour <= colour1;
			x <= x1;	
			y <= y1;	
			collision <= 0;
			doneCheck <= 0;
		end
		else if (select1 == 0 && select2 ==1 )	begin	// A selected
			colour <= colour2;
			x <= x2;	
			y <= y2;	
			collision <= 0;
			doneCheck <= 0;
		end
		else if (select1==0 && select2==0 && select3==1 ) begin		// heli selected
			colour <= colour3;
			x <= x3; 
			y <= y3;
			collision <= 0;
			doneCheck <= 0;
		end
		else if (select1==0 && select2==0 && select3==0 && select4==1 ) begin		// C selected
			colour <= colour4;
			x <= x4; 
			y <= y4;
			collision <= 0;
			doneCheck <= 0;
		end
		else if(check == 1) begin
			
			// collision with blockB
			if(x3>(x1-10) && x3<x1 && y3>(y1-10) && y3<y1)	begin	// bottom-right corner of heli against blockB
				collision <= 1;
			end			
			else if(x3>(x1-10) && x3<x1 && (y3-10)>(y1-10) && (y3-10)<y1) begin	// top-right against blockB
				collision <= 1;
			end
			else if((x3-10)>(x1-10) && (x3-10)<x1 && y3>(y1-10) && y3<y1) begin	// bottom-left against blockB
				collision <= 1;
			end
			else if((x3-10)>(x1-10) && (x3-10)<x1 && (y3-10)>(y1-10) && (y3-10)<y1) begin	// bottom-right against blockB
				collision <= 1;
			end
			
			// collision with blockA
			else if(x3>(x2-10) && x3<x2 && y3>(y2-10) && y3<y2)	begin	// bottom-right corner of heli against blockB
				collision <= 1;
			end			
			else if(x3>(x2-10) && x3<x2 && (y3-10)>(y2-10) && (y3-10)<y2) begin	// top-right against blockB
				collision <= 1;
			end
			else if((x3-10)>(x2-10) && (x3-10)<x2 && y3>(y2-10) && y3<y2) begin	// bottom-left against blockB
				collision <= 1;
			end
			else if((x3-10)>(x2-10) && (x3-10)<x2 && (y3-10)>(y2-10) && (y3-10)<y2) begin	// bottom-right against blockB
				collision <= 1;
			end
			
			// collision with blockC
			else if(x3>(x4-10) && x3<x4 && y3>(y4-10) && y3<y4)	begin	// bottom-right corner of heli against blockB
				collision <= 1;
			end			
			else if(x3>(x4-10) && x3<x4 && (y3-10)>(y4-10) && (y3-10)<y4) begin	// top-right against blockB
				collision <= 1;
			end
			else if((x3-10)>(x4-10) && (x3-10)<x4 && y3>(y4-10) && y3<y4) begin	// bottom-left against blockB
				collision <= 1;
			end
			else if((x3-10)>(x4-10) && (x3-10)<x4 && (y3-10)>(y4-10) && (y3-10)<y4) begin	// bottom-right against blockB
				collision <= 1;
			end
			
			else begin
				collision <= 0;				
			end			
			doneCheck <= 1;	
			colour <= 3'b000;
			x <= 0;
			y <= 0;			
		end
		else begin
			colour <= 3'b000;
			x <= 0;
			y <= 0;
			collision <= collision;
			doneCheck <= doneCheck;
		end
endmodule
