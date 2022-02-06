module rr_arbiter (clk,arst,update_i,req_i,grant_o);

	input clk;
	input arst;
	input update_i;
	input [1:0] req_i;
	output reg [1:0] grant_o;
	reg [1:0] mask_ff;
	reg [1:0] next_mask;
	reg [1:0] mask_req;
	reg [1:0] _sv2v_jump_rr;
	reg signed [1:0] i;
	reg signed [1:0] j;
	wire [1:0] raw_grant;
	wire [1:0] masked_grant;
	wire xnor0res,xnor1res,firstif,secondif,thirdif,fourthif,not_i,arst_value;
	wire [1:0] temp_mask_ff;
	high_prior_arbiter #(.N_OF_INPUTS(N_OF_INPUTS)) u_high_p_arb_raw(
		.req_i(req_i),
		.grant_o(raw_grant)
	);
	high_prior_arbiter #(.N_OF_INPUTS(N_OF_INPUTS)) u_high_p_arb_masked(
		.req_i(mask_req),
		.grant_o(masked_grant)
	);
	

	BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_rr[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_rr[1]) );
    AND2X1 U02 ( .A(mask_ff[0]), .B(req_i[0]), .Y(mask_req[0]) );
    AND2X1 U03 ( .A(mask_ff[1]), .B(req_i[1]), .Y(mask_req[1]) );
    BUFX1 U04 ( .A(mask_ff[0]), .Y(next_mask[0]) );
    BUFX1 U05 ( .A(mask_ff[1]), .Y(next_mask[1]) );
    XNOR2X1 U06 ( .IN1(mask_req[0]), .IN2(1'b0), .Q(xnor0res) );
    XNOR2X1 U07 ( .IN1(mask_req[1]), .IN2(1'b0), .Q(xnor1res) );
    MUX21X1 U08 (.IN1(masked_grant[0]), .IN2(raw_grant[0]), .S(xnor0res), .Q(grant_o[0]));
    MUX21X1 U09 (.IN1(masked_grant[1]), .IN2(raw_grant[1]), .S(xnor1res), .Q(grant_o[1]));

    BUFX1 U00 ( .A(1'b0), .Y(i[1]) );
    MUX21X1 U09 (.IN1(1'b0), .IN2(1'b1), .S(clk), .Q(i[0]));

   	AND2X1 U02 ( .A(_sv2v_jump_rr[1]), .B(1'b0), .Y(firstif) );
   	MUX21X1 U09 (.IN1(_sv2v_jump_rr[0]), .IN2(1'b0), .S(firstif), .Q(_sv2v_jump_rr[0]));
   	MUX21X1 U09 (.IN1(_sv2v_jump_rr[1]), .IN2(1'b0), .S(firstif), .Q(_sv2v_jump_rr[1]));
   	AND2X1 U02 ( .A(firstif), .B(grant_o[i[0]]), .Y(secondif) );
   	MUX21X1 U09 (.IN1(next_mask[0]), .IN2(1'b0), .S(secondif), .Q(next_mask[0]));
   	MUX21X1 U09 (.IN1(next_mask[1]), .IN2(1'b0), .S(secondif), .Q(next_mask[1]));
    MUX21X1 U09 (.IN1(1'b1), .IN2(1'b0), .S(i[0]), .Q(j[0]));
   	AND2X1 U02 ( .A(secondif), .B(j[0]), .Y(thirdif) );
    MUX21X1 U09 (.IN1(next_mask[j[0]]), .IN2(1'b1), .S(thirdif), .Q(next_mask[j[0]]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr[0]), .IN2(1'b0), .S(secondif), .Q(_sv2v_jump_rr[0]));
   	MUX21X1 U09 (.IN1(_sv2v_jump_rr[1]), .IN2(1'b1), .S(secondif), .Q(_sv2v_jump_rr[1]));
   	NAND2X1 U213 ( .IN1(_sv2v_jump_rr[0]), .IN2(_sv2v_jump_rr[1]), .QN(fourthif) );
   	MUX21X1 U09 (.IN1(_sv2v_jump_rr[0]), .IN2(1'b0), .S(fourthif), .Q(_sv2v_jump_rr[0]));
   	MUX21X1 U09 (.IN1(_sv2v_jump_rr[1]), .IN2(1'b0), .S(fourthif), .Q(_sv2v_jump_rr[1]));

   	MUX21X1 U09 (.IN1(_sv2v_jump_rr[1]), .IN2(1'b0), .S(arst), .Q(_sv2v_jump_rr[1]));

   	DFFX2 U30 ( .CLK(clk), .D(arst), .Q(arst_value) );
    DFFX2 U31 ( .CLK(arst), .D(arst), .Q(arst_value) );
    MUX21X1 U09 (.IN1(mask_ff[0]), .IN2(next_mask[0]), .S(update_i), .Q(temp_mask_ff[0]));
    MUX21X1 U09 (.IN1(mask_ff[1]), .IN2(next_mask[1]), .S(update_i), .Q(temp_mask_ff[1]));
	MUX21X1 U09 (.IN1(temp_mask_ff), .IN2(1'sb1), .S(arst_value), .Q(mask_ff[0]));
endmodule
