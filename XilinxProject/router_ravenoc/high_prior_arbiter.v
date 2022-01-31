module high_prior_arbiter (
	req_i,
	grant_o
);
	parameter signed [31:0] N_OF_INPUTS = 2;
	input [N_OF_INPUTS - 1:0] req_i;
	output reg [N_OF_INPUTS - 1:0] grant_o;
	always @(*) begin : sv2v_autoblock_1
		reg [0:1] _sv2v_jump;
		_sv2v_jump = 2'b00;
		grant_o = 1'sb0;
		begin : sv2v_autoblock_2
			reg signed [31:0] i;
			for (i = 0; i < N_OF_INPUTS; i = i + 1)
				if (_sv2v_jump < 2'b10) begin
					_sv2v_jump = 2'b00;
					if (req_i[i[$clog2(N_OF_INPUTS) - 1:0]]) begin
						grant_o = 1 << i[$clog2(N_OF_INPUTS) - 1:0];
						_sv2v_jump = 2'b10;
					end
				end
			if (_sv2v_jump != 2'b11)
				_sv2v_jump = 2'b00;
		end
	end
endmodule
