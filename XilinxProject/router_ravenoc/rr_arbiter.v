module rr_arbiter (
	clk,
	arst,
	update_i,
	req_i,
	grant_o
);
	parameter signed [31:0] N_OF_INPUTS = 2;
	input clk;
	input arst;
	input update_i;
	input [N_OF_INPUTS - 1:0] req_i;
	output reg [N_OF_INPUTS - 1:0] grant_o;
	reg [N_OF_INPUTS - 1:0] mask_ff;
	reg [N_OF_INPUTS - 1:0] next_mask;
	reg [N_OF_INPUTS - 1:0] mask_req;
	wire [N_OF_INPUTS - 1:0] raw_grant;
	wire [N_OF_INPUTS - 1:0] masked_grant;
	high_prior_arbiter #(.N_OF_INPUTS(N_OF_INPUTS)) u_high_p_arb_raw(
		.req_i(req_i),
		.grant_o(raw_grant)
	);
	high_prior_arbiter #(.N_OF_INPUTS(N_OF_INPUTS)) u_high_p_arb_masked(
		.req_i(mask_req),
		.grant_o(masked_grant)
	);
	always @(*) begin : sv2v_autoblock_1
		reg [0:1] _sv2v_jump;
		_sv2v_jump = 2'b00;
		mask_req = mask_ff & req_i;
		next_mask = mask_ff;
		grant_o = (mask_req == {N_OF_INPUTS {1'sb0}} ? raw_grant : masked_grant);
		begin : sv2v_autoblock_2
			reg signed [31:0] i;
			for (i = 0; i < N_OF_INPUTS; i = i + 1)
				if (_sv2v_jump < 2'b10) begin
					_sv2v_jump = 2'b00;
					if (grant_o[i[$clog2(N_OF_INPUTS) - 1:0]]) begin
						next_mask = 1'sb0;
						begin : sv2v_autoblock_3
							reg signed [31:0] j;
							for (j = i + 1; j < N_OF_INPUTS; j = j + 1)
								next_mask[j[$clog2(N_OF_INPUTS) - 1:0]] = 1'b1;
						end
						_sv2v_jump = 2'b10;
					end
				end
			if (_sv2v_jump != 2'b11)
				_sv2v_jump = 2'b00;
		end
	end
	always @(posedge clk or posedge arst)
		if (arst)
			mask_ff <= 1'sb1;
		else
			mask_ff <= (update_i ? next_mask : mask_ff);
endmodule
