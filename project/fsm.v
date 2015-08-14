//finite-state machine
module fsm (clock, resetn, doneheli, doneA, doneB, delayed,
		enableheli, enableA, enableB, enableoffsetx, enableoffsety, erase, enabledelay, resetdelay,
		doneCheck, collision, check, gameOver, doneC, enableC);
		
	input clock, resetn, doneheli, doneA, doneB, delayed, doneCheck, collision, doneC;
	output enableheli, enableA, enableB, enableoffsetx, enableoffsety, erase, enabledelay, resetdelay, check, gameOver, enableC;
	parameter A = 8'd1, B = 8'd2, C = 8'd4, D = 8'd8, E = 8'd16, F = 8'd32, G = 8'd64, H = 8'd128, I = 8'd129, J = 8'd130, X = 8'd131, Z = 8'd132;
	
	assign enableheli = (y_Q==A || y_Q==E);
	assign enableA = (y_Q==B || y_Q==F);
	assign enableB = (y_Q==C || y_Q==G);
	assign enableC = (y_Q==X || y_Q==Z);
	assign enableoffsetx = (y_Q==H);
	assign enableoffsety =(y_Q==H);
	assign enabledelay = (y_Q==D);
	assign resetdelay =(y_Q==D);
	assign erase = (y_Q==E || y_Q==F || y_Q==G || y_Q==Z);
	assign check = (y_Q==I);
	//assign gameOver = (y_Q==J);
	
	reg [7:0] y_Q;
	reg[7:0] Y_D;
	
	always @ (y_Q, doneheli, doneA, doneB, delayed, doneCheck, collision)
	begin: state_table
		case (y_Q)
		A: if (!doneheli) Y_D = A;	// draw heli
			else Y_D = B;		
		B: if (!doneA) Y_D = B;		// draw A
			else Y_D = C;	
		C: if (!doneB) Y_D = C;		// draw B
			else Y_D = X;
		X: if (!doneC) Y_D = X;		// draw C
			else Y_D = D; 
		D: if (!delayed) Y_D = D;	// hold
			else Y_D = E;
		E: if (!doneheli) Y_D = E;	// erase heli
			else Y_D = F;		
		F: if (!doneA) Y_D = F;		// erase A
			else Y_D = G;
		G: if (!doneB) Y_D = G;		// erase B
			else Y_D = Z;
		Z: if (!doneC) Y_D = Z;		// erase C
			else Y_D = H;
		H: Y_D = I;					// movement
		I: if(!doneCheck) Y_D = I;	// check collision
			else if(doneCheck && collision) Y_D = J;
			else Y_D = A;
		J: Y_D = J;					// game over
		default: Y_D = 8'bx;
		endcase
	end 
	
	always @ (posedge clock or negedge resetn)
	begin: state_FFs
		if (!resetn)
		begin
			y_Q <= A;
		end
		else
		begin
			y_Q <= Y_D;
		end
	end 
endmodule
